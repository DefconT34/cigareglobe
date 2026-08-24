<?php
// ════════════════════════════════════════════════════════
// tools/coherence_check.php — Le même fait, écrit à plusieurs endroits
// ────────────────────────────────────────────────────────
// C'est la panne centrale du lot R5, et elle a coûté sept corrections.
//
// Une correction ne suit pas la donnée : elle suit le CHAMP. Quand un
// même fait est écrit à trois endroits, le corriger une fois n'en
// corrige qu'un tiers, et les deux autres continuent de s'afficher sur
// la même page :
//
//   « Premier exportateur mondial en valeur » a été retiré de
//   rev_detail par la migration 028, faute de source. Il a survécu dans
//   notes jusqu'à la migration 031.
//
//   « Lombok » a été retiré des zones par la migration 030 — c'est du
//   Virginia pour cigarettes. Il est resté dans regions ET varieties.
//
//   « Jamastran Valley » a été francisé en zone, pas dans regions.
//
// Rien ne pouvait le voir : chaque champ était juste vis-à-vis de
// lui-même. Cet outil regarde ce qui doit concorder ENTRE les champs.
//
//   php tools/coherence_check.php
//
// Sortie 1 dès qu'une incohérence subsiste. Appelé par tests/run.php.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';
// Les familles d'aromes vivent dans leur propre fichier depuis ce
// lot : les inclure ici NE charge pas le routeur de l'API.
require_once __DIR__ . '/../backend/aromes.php';

$db = getDB();
$defauts = [];

// ── 1. La liste des régions doit suivre la carte ─────────
//
// `producer_countries.regions` nomme les régions de culture ;
// `production_zones` les pose sur le globe. Les deux décrivent la même
// chose et divergeaient sur neuf pays sur quinze.

/** Rend une chaîne comparable : sans accents, sans ponctuation, en bas de casse. */
function empreinte_nom(string $s): string {
    $s = (string)iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $s);
    return (string)preg_replace('/[^a-z0-9]/', '', strtolower($s));
}

$zones = [];
foreach ($db->query('SELECT country_id, name FROM production_zones') as $z) {
    $zones[$z['country_id']][] = $z['name'];
}

foreach ($db->query('SELECT id, regions FROM producer_countries ORDER BY id') as $c) {
    $listees = json_decode((string)$c['regions'], true);
    if (!is_array($listees)) $listees = [];
    $posees  = $zones[$c['id']] ?? [];

    // Un pays sans zone posée n'est pas en faute : les trois pays de la
    // migration 027 assument des fiches incomplètes plutôt que
    // remplies au jugé.
    if (!$listees && !$posees) continue;

    $l = array_map('empreinte_nom', $listees);
    $p = array_map('empreinte_nom', $posees);

    foreach (array_diff($l, $p) as $i => $_) {
        $defauts[] = sprintf('%s : « %s » est listee dans regions mais n\'est posee sur aucune zone',
                             $c['id'], $listees[$i]);
    }
    foreach (array_diff($p, $l) as $i => $_) {
        $defauts[] = sprintf('%s : la zone « %s » n\'est pas listee dans regions',
                             $c['id'], $posees[$i]);
    }
}

// ── 1 bis. Une etiquette de variete qui rate sa fiche ────
//
// `producer_countries.varieties` nomme les varietes ; `feuilles` porte
// leur article. Le front apparie par nom EXACT : une etiquette dont le
// nom differe d'un mot reste un simple mot, et la fiche derriere elle
// devient injoignable.
//
// C'est arrive DEUX FOIS dans la migration 040, sans que rien ne le
// dise : « San Andres Maduro Negro » pour une fiche nommee « Negro San
// Andres », « Broadleaf » pour « Connecticut Broadleaf ». Deux articles
// ecrits, sources, traduits en six langues — et invisibles.
//
// Le defaut est invisible PAR CONSTRUCTION : une etiquette non
// cliquable est le comportement normal d'une variete pas encore
// documentee. Rien ne distingue « pas encore ecrite » de « ecrite mais
// mal nommee » — sauf ce controle.
//
// Une variete SANS fiche n'est pas une faute en soi : le contenu se
// remplit par lots. Depuis la migration 052 il n'en reste toutefois
// AUCUNE — « Ecuador Sumatra » a recu son article, et le « Claro »
// mexicain a quitte la liste, n'etant pas une variete mais une nuance
// de cape.
//
// Les deux sens sont donc verifies : une fiche qu'aucune etiquette ne
// designe est injoignable, une etiquette sans fiche est un article
// qu'on croit ecrit et qui ne l'est pas. La seconde se leve legitimement
// des qu'un lot commence ; c'est alors au lot de la refermer.
$feuillesParPays = [];
try {
    foreach ($db->query('SELECT country_id, name FROM feuilles') as $f) {
        $feuillesParPays[$f['country_id']][] = $f['name'];
    }
} catch (Throwable $e) {
    // Table absente (base pas encore migree) : rien a comparer.
}

foreach ($db->query('SELECT id, varieties FROM producer_countries ORDER BY id') as $c) {
    $fiches = $feuillesParPays[$c['id']] ?? [];

    $listees = json_decode((string)$c['varieties'], true);
    if (!is_array($listees)) $listees = [];

    // Un pays sans AUCUNE fiche n'est pas forcement en retard : le Costa
    // Rica n'annonce aucune variete parce qu'il est une manufacture, pas
    // une origine de feuille. C'est la liste `varieties` qui fait foi.
    foreach ($fiches as $nom) {
        if (!in_array($nom, $listees, true)) {
            $defauts[] = sprintf(
                '%s : la feuille « %s » n\'est designee par aucune etiquette de varietes — sa fiche est injoignable',
                $c['id'], $nom);
        }
    }
    foreach ($listees as $etiquette) {
        if (!in_array($etiquette, $fiches, true)) {
            $defauts[] = sprintf(
                '%s : la variete « %s » est annoncee mais n\'a pas de fiche — l\'etiquette ne mene nulle part',
                $c['id'], $etiquette);
        }
    }
}

// ── 1quater. Deux notes qui disent la meme chose ─────────
//
// Signale par un lecteur : la fiche Corojo du Honduras portait
// « Épices » ET « Poivre », et le poivre est une epice.
//
// Le signal existait deja et personne ne le lisait. Le glossaire range
// chaque libelle dans une FAMILLE et sert une phrase par famille ; deux
// notes d'une meme famille affichent donc DEUX FOIS la meme icone et la
// meme glose. Le doublon etait visible a l'ecran depuis la migration
// 051 — il suffisait de comparer les familles d'une meme liste.
//
// On verifie aussi l'inverse : un libelle qui ne tombe dans AUCUNE
// famille s'affiche sans icone ni glose. C'est l'autre facon de rater
// la rubrique, et elle est silencieuse elle aussi.
{
    foreach ($db->query('SELECT id, notes, pairings FROM feuilles ORDER BY id') as $f) {
        foreach (['notes', 'pairings'] as $champ) {
            $parFamille = [];
            foreach (json_decode((string)$f[$champ], true) ?: [] as $t) {
                $fam = famille_arome((string)$t);
                if ($fam === '') {
                    $defauts[] = sprintf(
                        '%s : « %s » ne tombe dans aucune famille — ni icone ni glose',
                        $f['id'], $t);
                    continue;
                }
                $parFamille[$fam][] = $t;
            }
            foreach ($parFamille as $fam => $termes) {
                if (count($termes) < 2) continue;
                $defauts[] = sprintf(
                    '%s : %s porte « %s » — meme famille « %s », donc meme glose deux fois',
                    $f['id'], $champ, implode(' + ', $termes), $fam);
            }
        }
    }
}

// ── 1ter. Une marque a DEUX domiciles ────────────────────
//
// La table `brands` porte la fiche. La liste affichee sur la page d'un
// pays vient d'ailleurs : du JSON `producer_countries.brands`. Meme fait,
// deux adresses — et inserer dans l'une n'inscrit rien dans l'autre.
//
// Les migrations 081 et 082 ont ajoute Casdagli et Capitol dans `brands`
// seulement. Les deux repondaient 200 sur leur URL, la recherche les
// trouvait, et le chemin le plus naturel — ouvrir le pays sur le globe,
// lire ses maisons — ne les montrait pas. C'est le defaut de la
// migration 021, « les onze articles que personne ne pouvait ouvrir ».
//
// Le sens verifie est celui qui rend injoignable : une ligne de `brands`
// que la fiche de son pays n'annonce pas. L'inverse — une entree listee
// sans ligne en base — est deja couvert par tools/marques_check.php.
$marquesListees = [];
foreach ($db->query('SELECT id, brands FROM producer_countries') as $c) {
    foreach (json_decode((string)$c['brands'], true) ?: [] as $b) {
        if (!empty($b['name'])) $marquesListees[$c['id']][$b['name']] = true;
    }
}
foreach ($db->query('SELECT name, country_id FROM brands
                      WHERE country_id IS NOT NULL AND country_id <> ""
                      ORDER BY country_id, name') as $m) {
    // Un pays qui n'est pas producteur n'a pas de liste : les marques
    // rattachees a un marche ou a un pays de lounges ne sont pas
    // concernees.
    if (!isset($marquesListees[$m['country_id']])) continue;
    if (isset($marquesListees[$m['country_id']][$m['name']])) continue;
    $defauts[] = sprintf(
        '%s : la marque « %s » existe en base mais la fiche du pays ne l\'annonce pas — invisible depuis le globe',
        $m['country_id'], $m['name']);
}

// ── 2. Les rangs mondiaux que la relecture a bannis ──────
//
// R1, R4 et R5 ont retire tous les classements mondiaux non sources :
// personne ne publie de production mondiale de cigares, ni de
// classement d'exportateurs en valeur. La regle retenue est d'ecrire la
// REPUTATION, qui est vraie, plutot que le RANG, qui n'existe pas —
// « la terre a tabac la plus reputee au monde » et non « la meilleure
// terre a tabac du monde ».
//
// Ces tournures reviennent naturellement sous la plume. Sans garde-fou
// elles reviendront, et il faudra les rechercher a la main une
// quatrieme fois.
const TOURNURES_BANNIES = [
    '/\bmeilleur[es]?\b/iu'                         => 'superlatif de qualite — dire la reputation',
    '/\bpremi(?:er|ere)\s+(?:producteur|exportateur|fournisseur)\b/iu'
                                                    => 'rang mondial non publie',
    '/\b(?:1er|premier)\s+mondial\b/iu'             => 'rang mondial non publie',
    '/\ble\s+plus\s+(?:utilise|vendu|produit)\b/iu' => 'classement non mesure',
];

$aBalayer = [
    'producer_countries' => ['id',   ['notes', 'climate', 'soil', 'production', 'rev_detail']],
    'production_zones'   => ['id',   ['note']],
];

foreach ($aBalayer as $table => [$cle, $champs]) {
    $sel = implode(', ', array_map(fn($c) => "`$c`", array_merge([$cle], $champs)));
    foreach ($db->query("SELECT $sel FROM `$table`") as $r) {
        foreach ($champs as $champ) {
            $v = (string)($r[$champ] ?? '');
            if ($v === '') continue;
            // Comparer sans accents : « réputé » et « repute » doivent
            // se valoir, sans quoi le motif rate une valeur sur deux.
            $plat = (string)iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $v);
            foreach (TOURNURES_BANNIES as $motif => $pourquoi) {
                if (preg_match($motif, $plat)) {
                    $defauts[] = sprintf('%s#%s.%s : « %s » — %s',
                                         $table, $r[$cle], $champ, $v, $pourquoi);
                }
            }
        }
    }
}

// ── 3. Le repli de la base contre ce que l'ecran affiche ─
//
// Devise et fuseau sont ecrits DEUX FOIS : dans `producer_geo`, qui ne
// sert que de repli, et dans `data.pays.js`, qui est ce que le visiteur
// voit. Rien ne les reliait.
//
// C'est ainsi que les Canaries ont affiche l'heure de Madrid : la table
// du front est indexee par code ISO, ce code est deduit du DRAPEAU, et
// l'archipel arbore celui de l'Espagne. Il heritait donc de
// Europe/Madrid — une heure de trop toute l'annee. La base, elle,
// disait « UTC+0 », c'est-a-dire juste. Le repli avait raison et
// l'ecran avait tort, et personne ne pouvait le voir sans comparer les
// deux copies.

/** Lit PAYS_INFOS et TERRITOIRES_INFOS depuis le fichier du front. */
function tables_du_front(string $chemin): array {
    $js = (string)@file_get_contents($chemin);
    $out = ['pays' => [], 'territoires' => []];
    // ISO: ['XXX', 'aa,bb', 'Zone/IANA']
    if (preg_match_all('/^\s{2}([A-Z]{2}):\s*\[\'([A-Z]{3})\',\s*\'([a-z,]+)\',\s*\'([^\']+)\'\]/m',
                       $js, $m, PREG_SET_ORDER)) {
        foreach ($m as $x) $out['pays'][$x[1]] = [$x[2], $x[3], $x[4]];
    }
    if (preg_match_all('/^\s{2}([a-z]+):\s*\[\'([A-Z]{3})\',\s*\'([a-z,]+)\',\s*\'([^\']+)\'\]/m',
                       $js, $m, PREG_SET_ORDER)) {
        foreach ($m as $x) $out['territoires'][$x[1]] = [$x[2], $x[3], $x[4]];
    }
    return $out;
}

/**
 * Decalage STANDARD d'une zone IANA, en heures — celui HORS heure d'ete.
 *
 * Premiere version : on prenait les decalages de janvier ET de juillet
 * et on acceptait l'un ou l'autre, pour ne pas faire echouer Cuba six
 * mois par an. C'etait trop laxiste, et la contre-epreuve l'a montre —
 * « UTC+1 » injecte sur les Canaries passait sans bruit, puisque c'est
 * leur decalage d'ete. Un controle qui accepte les deux reponses ne
 * verifie rien.
 *
 * Ce qu'une fiche annonce est le decalage standard : « UTC−5 » pour
 * Cuba, « UTC+0 » pour les Canaries. On le lit sur le drapeau isdst des
 * transitions plutot que de le deviner par la saison — l'hemisphere sud
 * inverse janvier et juillet.
 */
function decalage_standard(string $zone): ?int {
    try { $tz = new DateTimeZone($zone); } catch (Throwable $e) { return null; }
    $debut = (new DateTime('2026-01-01', new DateTimeZone('UTC')))->getTimestamp();
    $fin   = (new DateTime('2027-01-01', new DateTimeZone('UTC')))->getTimestamp();
    foreach ($tz->getTransitions($debut, $fin) as $t) {
        if (empty($t['isdst'])) return (int)($t['offset'] / 3600);
    }
    // Zone sans transition sur la periode : son decalage est constant.
    return (int)((new DateTime('2026-01-15', $tz))->getOffset() / 3600);
}

// L'identifiant de fiche ne porte pas son code ISO : il se deduit du
// drapeau, comme dans le front. On refait ici le meme calcul, sur les
// indicateurs regionaux de l'emoji.
function iso_depuis_drapeau(string $drapeau): string {
    $cps = [];
    foreach (preg_split('//u', $drapeau, -1, PREG_SPLIT_NO_EMPTY) ?: [] as $c) {
        $n = mb_ord($c, 'UTF-8');
        if ($n >= 0x1F1E6 && $n <= 0x1F1FF) $cps[] = chr($n - 0x1F1E6 + ord('A'));
    }
    return count($cps) === 2 ? implode('', $cps) : '';
}

$front = tables_du_front(__DIR__ . '/../assets/js/data.pays.js');
if (!$front['pays']) {
    $defauts[] = 'data.pays.js : aucune ligne lisible — le motif de lecture a-t-il change ?';
} else {
    $q = $db->query('SELECT g.country_id, g.currency, g.timezone, c.flag
                     FROM producer_geo g JOIN producer_countries c ON c.id = g.country_id
                     ORDER BY g.country_id');
    foreach ($q as $r) {
        $id = $r['country_id'];
        // Le territoire l'emporte sur le drapeau : c'est tout l'objet
        // de TERRITOIRES_INFOS.
        $d = $front['territoires'][$id] ?? ($front['pays'][iso_depuis_drapeau((string)$r['flag'])] ?? null);
        if (!$d) continue;   // pays hors table : le repli sert vraiment, rien a comparer

        // Devise : comparer les codes ISO, pas les libelles.
        if (preg_match_all('/\(([A-Z]{3})\)/', (string)$r['currency'], $mm) && $mm[1]) {
            if (!in_array($d[0], $mm[1], true)) {
                $defauts[] = sprintf('%s : la base dit « %s », l\'ecran affiche %s',
                                     $id, $r['currency'], $d[0]);
            }
        } else {
            $defauts[] = sprintf('%s : « %s » ne porte aucun code ISO 4217',
                                 $id, $r['currency']);
        }

        // Fuseau : le premier decalage annonce est celui de la capitale.
        if (preg_match('/UTC\s*([+\x{2212}\-])\s*(\d{1,2})/u', (string)$r['timezone'], $mm)) {
            $signe = ($mm[1] === '+') ? 1 : -1;
            $attendu = decalage_standard($d[2]);
            if ($attendu !== null && $signe * (int)$mm[2] !== $attendu) {
                $defauts[] = sprintf('%s : la base dit « %s », %s est a UTC%+d hors heure d\'ete',
                                     $id, $r['timezone'], $d[2], $attendu);
            }
        }
    }
}

// ── 4. data.pays.js contre tzdata et CLDR ────────────────
//
// Le fichier porte depuis sa creation la mention « A RELIRE, saisi de
// memoire », et couvre 93 pays. Les relire un par un serait refaire
// l'erreur qu'on corrige : PHP embarque deja les deux sources de
// reference — tzdata pour les fuseaux, ICU/CLDR pour les devises.
//
// Ce controle a trouve ce que la relecture manuelle n'avait pas vu :
// le florin des Antilles neerlandaises (ANG), remplace par le florin
// caribeen (XCG) le 31 mars 2025, et quatre pays dont l'heure affichee
// ne vaut pas pour tout le territoire — dont l'ESPAGNE et l'EQUATEUR,
// ce dernier etant un pays producteur deja relu a la main.
//
// Il vaut surtout pour l'avenir : une devise qui change ou un pays qui
// abandonne l'heure d'ete apparaitront a la mise a jour suivante d'ICU
// ou de tzdata, sans que personne ait a y penser.

// tzdata rattache Europe/Simferopol a l'Ukraine : c'est l'heure imposee
// en Crimee occupee, pas une seconde heure legale ukrainienne. Signaler
// UA comme pays a plusieurs fuseaux enterinerait l'occupation.
const MULTIFUSEAUX_REFUSES = [
    'UA' => 'Europe/Simferopol est l\'heure imposee en Crimee occupee ; '
          . 'l\'heure legale ukrainienne est UTC+2 sur tout le territoire',
];

if (!$front['pays']) {
    // deja signale plus haut
} elseif (!extension_loaded('intl')) {
    echo "  (intl absent : le controle des devises de data.pays.js est saute)\n\n";
} else {
    preg_match('/PAYS_MULTIFUSEAUX = \[([^\]]+)\]/',
               (string)@file_get_contents(__DIR__ . '/../assets/js/data.pays.js'), $mz);
    preg_match_all("/'([A-Z]{2})'/", $mz[1] ?? '', $mzz);
    $declares = $mzz[1] ?? [];

    foreach ($front['pays'] as $iso => $d) {
        // Devise : celle que CLDR donne pour la region.
        $f = NumberFormatter::create("en_$iso", NumberFormatter::CURRENCY);
        $attendue = $f ? $f->getTextAttribute(NumberFormatter::CURRENCY_CODE) : null;
        if ($attendue && $attendue !== $d[0]) {
            $defauts[] = sprintf('data.pays.js %s : devise %s, CLDR donne %s',
                                 $iso, $d[0], $attendue);
        }

        // Fuseau : appartient-il bien a ce pays ?
        $zonesDuPays = DateTimeZone::listIdentifiers(DateTimeZone::PER_COUNTRY, $iso) ?: [];
        if ($zonesDuPays && !in_array($d[2], $zonesDuPays, true)) {
            $defauts[] = sprintf('data.pays.js %s : %s n\'est pas une zone de ce pays',
                                 $iso, $d[2]);
        }

        // Le pays a-t-il plusieurs decalages sans le dire ?
        $offsets = [];
        foreach ($zonesDuPays as $z) {
            $o = decalage_standard($z);
            if ($o !== null) $offsets[$o] = true;
        }
        $multi = count($offsets) > 1;
        if ($multi && !in_array($iso, $declares, true) && !isset(MULTIFUSEAUX_REFUSES[$iso])) {
            $defauts[] = sprintf('data.pays.js %s : %d decalages (%s) mais absent de PAYS_MULTIFUSEAUX',
                                 $iso, count($offsets),
                                 implode(' ', array_map(fn($o) => sprintf('%+d', $o), array_keys($offsets))));
        }
        if (!$multi && in_array($iso, $declares, true)) {
            $defauts[] = sprintf('data.pays.js %s : declare multifuseaux mais n\'a qu\'un decalage', $iso);
        }
    }
}

// ── 4 bis. Un pays producteur sans drapeau dessine ───────
//
// `drawFlag()` peint chaque drapeau en code, et FLAGS_DESSINES declare
// ceux qu'il sait tracer. Tout autre identifiant tombe sur trois bandes
// grises.
//
// Le defaut est INVISIBLE PAR CONSTRUCTION, comme celui des etiquettes
// de varietes : trois bandes grises sont un dessin valide pour qui ne
// connait pas le drapeau attendu. La liste en comptait douze quand
// l'atlas avait seize pays — le Costa Rica, les Canaries et la Jamaique
// depuis des mois, l'Italie depuis la migration 053, c'est-a-dire
// depuis le chantier qui aurait du y penser.
$flagsJs = (string)@file_get_contents(__DIR__ . '/../assets/js/flags.js');
if (preg_match('/FLAGS_DESSINES\s*=\s*\[(.*?)\]/s', $flagsJs, $mf)) {
    preg_match_all("/'([a-z0-9_-]+)'/", $mf[1], $mff);
    $dessines = $mff[1] ?? [];
    // Les TROIS familles de fiches, pas seulement les producteurs : un
    // pays a lounges et un marche ouvrent le meme panneau et appellent
    // le meme drawFlag(). Ne verifier que les seize producteurs aurait
    // laisse quatre-vingt-sept fiches sur des bandes grises.
    foreach (['producer_countries' => 'pays producteur',
              'lounge_countries'   => 'pays a lounges',
              'markets'            => 'marche'] as $table => $quoi) {
        foreach ($db->query("SELECT id FROM `$table` ORDER BY id") as $c) {
            if (!in_array($c['id'], $dessines, true)) {
                $defauts[] = sprintf(
                    '%s (%s) : aucun drapeau dessine dans flags.js — la fiche affiche trois bandes grises',
                    $c['id'], $quoi);
            }
        }
    }
    $nbDessines = count($dessines);
} else {
    $defauts[] = 'flags.js : FLAGS_DESSINES introuvable — le controle des drapeaux n\'a rien verifie';
}

// ── 5. Un UPDATE du dump ne doit toucher qu'UNE ligne ────
//
// CE QUI EST ARRIVE. sql/traductions.sql est genere par i18n_dump.php,
// qui identifiait chaque ligne par la premiere colonne de sa cle
// primaire. Sur `aromes`, dont la cle est (famille, contexte), le dump
// ecrivait « WHERE famille = 'cacao' » : deux lignes designees, et la
// glose de l'accord recopiee sur celle de la note au prochain rejeu.
//
// Rien ne l'aurait signale. Le dump se relit parfaitement, la base
// reste coherente, le compteur de fraicheur ne bronche pas — c'est
// seulement le texte affiche qui devient faux, et il faut connaitre les
// deux gloses pour s'en apercevoir.
//
// On ne verifie donc pas la forme du fichier mais sa PORTEE : chaque
// WHERE genere est rejoue en SELECT COUNT(*), et doit rendre 1.
$dump = __DIR__ . '/../sql/traductions.sql';
if (is_file($dump)) {
    $vus = 0;
    foreach (file($dump, FILE_IGNORE_NEW_LINES) as $no => $ligne) {
        if (!preg_match('/^UPDATE `([a-z_]+)` SET .* WHERE (.+);$/', $ligne, $m)) continue;
        $vus++;
        try {
            $n = (int)$db->query("SELECT COUNT(*) FROM `$m[1]` WHERE $m[2]")->fetchColumn();
        } catch (Throwable $e) {
            $defauts[] = sprintf('traductions.sql ligne %d : WHERE illisible — %s',
                                 $no + 1, $e->getMessage());
            continue;
        }
        if ($n !== 1) {
            $defauts[] = sprintf('traductions.sql ligne %d : « WHERE %s » designe %d lignes de %s',
                                 $no + 1, $m[2], $n, $m[1]);
        }
    }
    // Un fichier qu'on ne sait pas lire passerait pour un fichier sain :
    // le nombre d'UPDATE reconnus fait donc partie du rapport.
    if ($vus === 0) {
        $defauts[] = 'traductions.sql : aucun UPDATE reconnu — le controle n\'a rien verifie';
    }
    $updatesDump = $vus;
}

// ── Rapport ──────────────────────────────────────────────

echo "CigarOdyssey — coherence entre champs\n\n";

if (!$defauts) {
    echo "  Les listes de regions suivent les zones posees sur le globe.\n";
    // Dans cette branche $varietesSansFiche vaut zero par construction :
    // afficher « N fiches pour N etiquettes » donnerait l'illusion de
    // deux comptes independants qui concordent. Un seul chiffre, donc.
    printf("  Les %d etiquettes de varietes ont chacune leur fiche, et reciproquement.\n",
           array_sum(array_map('count', $feuillesParPays)));
    echo "  Aucun rang mondial non source n'est reapparu.\n";
    echo "  Le repli de la base dit la meme devise et le meme fuseau que l'ecran.\n";
    printf("  Les %d pays de data.pays.js concordent avec tzdata %s et ICU %s.\n",
           count($front['pays']), timezone_version_get(),
           extension_loaded('intl') ? INTL_ICU_VERSION : '(absent)');
    if (isset($nbDessines)) {
        $fiches = 0;
        foreach (['producer_countries','lounge_countries','markets'] as $t) {
            $fiches += (int)$db->query("SELECT COUNT(*) FROM `$t`")->fetchColumn();
        }
        printf("  Les %d fiches pays, lounges et marches ont chacune leur drapeau dessine.\n", $fiches);
    }
    if (isset($updatesDump)) {
        printf("  Les %d UPDATE de traductions.sql designent chacun une seule ligne.\n",
               $updatesDump);
    }
    foreach (MULTIFUSEAUX_REFUSES as $iso => $pourquoi) {
        echo "  $iso : ecart assume — " . preg_replace('/\s+/', ' ', $pourquoi) . "\n";
    }
    exit(0);
}

foreach ($defauts as $d) echo "  ECHEC  $d\n";
printf("\n%d incoherence(s). Voir docs/relecture.md, lot 5.\n", count($defauts));
exit(1);
