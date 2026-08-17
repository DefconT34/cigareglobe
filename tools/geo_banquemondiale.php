<?php
// ════════════════════════════════════════════════════════
// tools/geo_banquemondiale.php — Population et PIB des fiches pays
// ────────────────────────────────────────────────────────
// Le lot R2 a trouvé QUATORZE PIB périmés sur quatorze, plusieurs de
// 30 à 48 %. Ils portaient tous « (2022) » et personne ne les avait
// regardés depuis. Les corriger à la main aurait reproduit la panne
// trois ans plus tard, à l'identique.
//
// Une valeur qui vieillit ne se corrige pas, elle s'entretient. La
// Banque mondiale publie les deux indicateurs en JSON, par pays, avec
// l'année attachée à chaque point — c'est une source primaire et
// lisible par machine, pas une page à recopier.
//
//   php tools/geo_banquemondiale.php              # comparer, ne rien ecrire
//   php tools/geo_banquemondiale.php --maj        # ecrire en base
//   php tools/geo_banquemondiale.php --verifier   # hors ligne, pour la campagne
//
// --verifier NE TOUCHE PAS AU RESEAU : la campagne de tests doit
// pouvoir tourner sans Internet. Il vérifie seulement que chaque valeur
// affichée porte son année et que cette année n'a pas trop vieilli.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';

// Correspondance id du site -> code ISO-2 de la Banque mondiale.
// Les Canaries n'y sont pas : ce n'est pas un pays, c'est une
// communauté autonome espagnole. Elles sont traitées a part, plus bas.
const PAYS_BM = [
    'brazil'      => 'BR', 'cameroon'  => 'CM', 'costarica' => 'CR',
    'cuba'        => 'CU', 'dominican' => 'DO', 'ecuador'   => 'EC',
    'honduras'    => 'HN', 'indonesia' => 'ID', 'jamaica'   => 'JM',
    'mexico'      => 'MX', 'nicaragua' => 'NI', 'panama'    => 'PA',
    'philippines' => 'PH', 'usa'       => 'US',
];

// Les pays dont la source elle-meme n'a plus rien de recent. Ce n'est
// pas une derogation de confort : c'est la difference entre « on n'a
// pas regarde depuis quatre ans » et « personne ne publie ». Meme
// principe que SANS_FOND dans coords_check.php.
const SANS_RECENT = [
    'cuba' => 'La Banque mondiale n\'a plus de PIB cubain apres 2020 — '
            . 'La Havane ne transmet plus, et les series officielles sont '
            . 'de toute facon calculees au taux de change administratif.',
];

// Au-dela, la valeur est declaree perimee. Trois ans laisse passer le
// delai normal de publication (une annee n est diffusee courant n+1)
// sans laisser dormir un chiffre de 2022 jusqu'en 2026.
const ANS_TOLERES = 3;

const INDICATEURS = [
    'population' => 'SP.POP.TOTL',
    'gdp'        => 'NY.GDP.MKTP.CD',
];

// ── Mise en forme francaise ──────────────────────────────

/** 212 812 405 -> « 212,8 M ». */
function format_population(float $v): string {
    return number_format($v / 1e6, 1, ',', ' ') . ' M';
}

/** 2 279 920 092 492 -> « 2,28 T$ » ; 58 933 453 924 -> « 58,9 Md$ ». */
function format_pib(float $v): string {
    if ($v >= 1e12) return number_format($v / 1e12, 2, ',', ' ') . ' T$';
    return number_format($v / 1e9, 1, ',', ' ') . ' Md$';
}

/** Extrait l'annee d'une valeur affichee : « 58,9 Md$ (2025) » -> 2025. */
function annee_de(?string $valeur): ?int {
    if ($valeur !== null && preg_match('/\((\d{4})\)/', $valeur, $m)) {
        return (int)$m[1];
    }
    return null;
}

// ── Lecture de la source ─────────────────────────────────

/**
 * Rend, par pays et par champ, la valeur non nulle la plus recente.
 *
 * L'API pagine a 50 par defaut et repond en deux blocs : [meta, data].
 * On demande une plage d'annees plutot que le parametre « valeur la
 * plus recente », qui rend une erreur sur cette version de l'API.
 *
 * @return array<string,array<string,array{0:int,1:float}>>
 */
function lire_banque_mondiale(): array {
    $codes = implode(';', array_values(PAYS_BM));
    $parIso = array_flip(PAYS_BM);
    $out = [];

    foreach (INDICATEURS as $champ => $indicateur) {
        $url = "https://api.worldbank.org/v2/country/$codes/indicator/$indicateur"
             . '?format=json&per_page=1000&date=2015:' . date('Y');
        $brut = @file_get_contents($url, false, stream_context_create([
            'http' => ['timeout' => 60, 'user_agent' => 'CigarOdyssey/relecture'],
        ]));
        if ($brut === false) {
            fwrite(STDERR, "ABANDON : la Banque mondiale ne repond pas ($indicateur).\n");
            exit(2);
        }
        $j = json_decode($brut, true);
        if (!isset($j[1]) || !is_array($j[1])) {
            fwrite(STDERR, "ABANDON : reponse inattendue pour $indicateur.\n");
            exit(2);
        }
        foreach ($j[1] as $r) {
            if ($r['value'] === null) continue;
            $id = $parIso[$r['country']['id']] ?? null;
            if ($id === null) continue;
            $an = (int)$r['date'];
            if (isset($out[$id][$champ]) && $out[$id][$champ][0] >= $an) continue;
            $out[$id][$champ] = [$an, (float)$r['value']];
        }
    }
    return $out;
}

// ── Verification hors ligne (appelee par la campagne) ────

if (in_array('--verifier', $argv, true)) {
    $db = getDB();
    $q = $db->query('SELECT country_id, population, gdp FROM producer_geo ORDER BY country_id');
    $cette_annee = (int)date('Y');
    $defauts = [];

    foreach ($q as $r) {
        $id = $r['country_id'];
        foreach (['population', 'gdp'] as $champ) {
            $v = $r[$champ];
            // Une case vide est un choix assume (les Canaries n'ont pas
            // de PIB propre), pas un oubli. On ne reproche rien au vide.
            if ($v === null || $v === '' || $v === '—') continue;

            $an = annee_de($v);
            if ($an === null) {
                $defauts[] = "$id.$champ : « $v » n'annonce pas son annee";
                continue;
            }
            if ($cette_annee - $an > ANS_TOLERES && !isset(SANS_RECENT[$id])) {
                $defauts[] = "$id.$champ : « $v » a " . ($cette_annee - $an) . " ans";
            }
        }
    }

    echo "CigarOdyssey — fraicheur des donnees Banque mondiale\n\n";
    foreach (SANS_RECENT as $id => $pourquoi) {
        echo "  $id : dispense — " . preg_replace('/\s+/', ' ', $pourquoi) . "\n";
    }
    echo "\n";

    if (!$defauts) {
        printf("Toutes les valeurs portent leur annee et ont %d ans ou moins.\n", ANS_TOLERES);
        exit(0);
    }
    foreach ($defauts as $d) echo "  ECHEC  $d\n";
    echo "\nRafraichir : php tools/geo_banquemondiale.php --maj\n";
    exit(1);
}

// ── Comparaison / mise a jour ────────────────────────────

$ecrire = in_array('--maj', $argv, true);
$db = getDB();
$source = lire_banque_mondiale();

$actuel = [];
foreach ($db->query('SELECT country_id, population, gdp FROM producer_geo') as $r) {
    $actuel[$r['country_id']] = $r;
}

$maj = $db->prepare('UPDATE producer_geo SET population = ?, gdp = ? WHERE country_id = ?');
$change = 0;

printf("%-13s %-22s %-22s\n", 'pays', 'en base', 'Banque mondiale');
echo str_repeat('-', 60), "\n";

foreach (PAYS_BM as $id => $iso) {
    if (!isset($source[$id])) { printf("%-13s AUCUNE DONNEE\n", $id); continue; }

    $pop = isset($source[$id]['population'])
         ? format_population($source[$id]['population'][1]) . ' (' . $source[$id]['population'][0] . ')'
         : ($actuel[$id]['population'] ?? null);
    $pib = isset($source[$id]['gdp'])
         ? format_pib($source[$id]['gdp'][1]) . ' (' . $source[$id]['gdp'][0] . ')'
         : ($actuel[$id]['gdp'] ?? null);

    $avant = ($actuel[$id]['population'] ?? '—') . ' / ' . ($actuel[$id]['gdp'] ?? '—');
    $apres = $pop . ' / ' . $pib;
    $signe = ($avant === $apres) ? ' ' : '*';
    printf("%s%-12s %-22s %-22s\n", $signe, $id, $avant, $apres);

    if ($avant !== $apres) {
        $change++;
        if ($ecrire) $maj->execute([$pop, $pib, $id]);
    }
}

echo "\n";
if ($ecrire) {
    printf("%d pays mis a jour.\n", $change);
    echo "Les fiches pays ne sont pas traduites sur ces deux champs : ce sont\n";
    echo "des nombres. Rien a reexporter.\n";
} else {
    printf("%d pays differeraient. Rien n'a ete ecrit — ajouter --maj.\n", $change);
}
exit(0);
