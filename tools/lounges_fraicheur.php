<?php
// ════════════════════════════════════════════════════════
// lounges_fraicheur.php — Ce qu'on peut savoir d'une cave sans y aller
// ────────────────────────────────────────────────────────
//   php tools/lounges_fraicheur.php               l'état, fiche par fiche
//   php tools/lounges_fraicheur.php --pays=france  un pays
//   php tools/lounges_fraicheur.php --sonder       INTERROGE LE RESEAU, fige les sondes
//   php tools/lounges_fraicheur.php --verifier     hors ligne, pour la campagne
//   php tools/lounges_fraicheur.php --autotest     les cas construits
//
// CE QUE CET OUTIL FAIT. 508 fiches d'etablissements, 408 publiables,
// ecrites entre le 1er aout et le 5 septembre 2026, et personne n'a
// jamais sonde si elles existent encore. Il ne peut pas le savoir non
// plus — un depot de code n'appelle pas un bar. Mais il peut dire, pour
// chaque fiche, DE QUOI ELLE TIENT :
//   · la classe de sa source — un site officiel, un annuaire de reseau,
//     la presse du metier, ou seulement Google Maps, TripAdvisor et
//     « a verifier », qui ne prouvent pas qu'un lieu est ouvert ;
//   · si la source porte une annee ;
//   · si le site que la fiche cite repond encore (sonde HTTP, figee).
// Et il en tire une liste : les fiches A RELIRE — celles qu'une
// personne doit chercher avant qu'on les laisse en ligne plus longtemps.
//
// POURQUOI UNE SONDE HTTP, ALORS QUE sources.php N'EN VEUT PAS. Pour un
// DOMAINE, le HTTP ment une fois sur trois — un site qui refuse un robot
// n'est pas un site mort. Ici la question est autre : la fiche cite
// l'adresse du lieu lui-meme, et l'atlas ne conclut que sur ce qui ne
// ment pas — un nom qui ne resout plus, une connexion refusee, un 404
// ou un 410. Un 403, un 429, un 5xx sont « refuse », et « refuse » n'est
// pas « mort » : on l'ecrit, on ne conclut pas.
//
// La sonde ecrit un sceau versionne (sql/lounges_sondes.json) ; la
// campagne de tests ne touche pas au reseau, elle lit le sceau.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli' && !defined('LOUNGES_INCLUDE')) { http_response_code(404); exit; }
require_once __DIR__ . '/../backend/config.php';

const LOUNGES_SONDES  = __DIR__ . '/../sql/lounges_sondes.json';
const LOUNGES_SCEAU   = __DIR__ . '/../sql/lounges_fraicheur.json';
const LOUNGES_DELAI_S = 15;

/**
 * La classe d'une source, lue dans le texte libre du champ.
 *
 *   a_verifier  la fiche le dit elle-meme : l'absence declaree de source
 *   relue       « a verifier — relu le 17 septembre 2026 : ... » : quelqu'un
 *               a cherche, a une date ecrite, et n'a rien trouve qui
 *               tranche. Ce n'est pas une source ; c'est une lecture datee,
 *               qui vaut dix-huit mois avant qu'on recommence
 *   faible      un annuaire grand public qui ne prouve pas l'ouverture
 *   reseau      l'annuaire officiel d'un reseau (Habanos, Davidoff,
 *               Cohiba Atmosphere) — primaire, mais rarement date
 *   sourcee     tout le reste : site du lieu, de l'hotel, presse du metier
 *
 * Les motifs sont volontairement etroits : un « Google Maps » cite EN
 * PLUS d'un site officiel ne rabaisse pas la fiche. On regarde ce qui
 * reste quand on retire les mentions faibles.
 */
function lf_classe_source(string $source): string {
    $s = trim($source);
    if ($s === '') return 'a_verifier';
    if (preg_match('/^RETIR[ÉE]/u', $s)) return 'retiree';
    // « — relu le 17 septembre 2026 : ... » : on classe ce qui precede,
    // et une absence ou une faiblesse RELUE devient « relue ».
    $relue = (bool)preg_match('/—\s*relue?\s+le\s+\d{1,2}(?:er)?\s+\S+\s+20\d\d/iu', $s);
    if ($relue) $s = trim((string)preg_replace('/\s*—\s*relue?\s+le\s+\d{1,2}(?:er)?\s+\S+\s+20\d\d.*$/su', '', $s));
    if ($s === '' || preg_match('/^(à|a)\s+v[ée]rifier\b/iu', $s)) return $relue ? 'relue' : 'a_verifier';
    $faibles = ['google maps', 'tripadvisor', 'yelp', 'foursquare', 'fourni par l\'établissement', 'fourni par l’établissement'];
    $reste = $s;
    foreach ($faibles as $f) $reste = str_ireplace($f, '', $reste);
    $reste = trim($reste, " \t,;—-·");
    if ($reste === '') return $relue ? 'relue' : 'faible';
    if (preg_match('/habanos|davidoff\.com|cohiba-atmosphere|habanomag/iu', $reste)) return 'reseau';
    return 'sourcee';
}

/** L'annee que porte la source, ou null. Une annee de fondation (1787) n'en est pas une. */
function lf_annee_source(string $source): ?int {
    if (preg_match_all('/\b(20[12]\d)\b/', $source, $m)) {
        return (int)max($m[1]);
    }
    return null;
}

/**
 * L'age d'une relecture, en mois, ou null. « relu le 17 septembre 2026 »
 * se lit en francais, le mois en toutes lettres ; on compte depuis $ref
 * (aujourd'hui par defaut).
 */
function lf_mois_depuis_relecture(string $source, ?string $ref = null): ?int {
    static $mois = ['janvier' => 1, 'février' => 2, 'fevrier' => 2, 'mars' => 3, 'avril' => 4, 'mai' => 5, 'juin' => 6,
        'juillet' => 7, 'août' => 8, 'aout' => 8, 'septembre' => 9, 'octobre' => 10, 'novembre' => 11, 'décembre' => 12, 'decembre' => 12];
    if (!preg_match('/relue?\s+le\s+(\d{1,2})(?:er)?\s+(\S+)\s+(20\d\d)/iu', $source, $m)) return null;
    $mo = $mois[mb_strtolower($m[2])] ?? null;
    if ($mo === null) return null;
    $d = new DateTimeImmutable(sprintf('%04d-%02d-%02d', (int)$m[3], $mo, (int)$m[1]));
    $r = new DateTimeImmutable($ref ?? 'today');
    $diff = $d->diff($r);
    return $diff->invert ? 0 : $diff->y * 12 + $diff->m;
}

const LOUNGES_RELECTURE_MOIS = 18;

/**
 * Ce qu'une sonde HTTP rend, en trois mots.
 *
 *   ok      2xx apres redirections
 *   mort    nom qui ne resout pas, connexion refusee, 404, 410
 *   refuse  401, 403, 429, 5xx — le site vit peut-etre, il ne veut pas
 *           d'un robot ; on ne conclut pas
 */
function lf_verdict_http(?int $code, bool $reseau_ok, string $erreur = ''): string {
    if (!$reseau_ok) return 'mort';
    // Une connexion refusee ou un nom introuvable : mort. Un transport
    // qui casse en route — TLS, HTTP/2, delai — ne dit rien du lieu.
    if ($code === null) return preg_match('/refused|could not resolve|failed to connect|^connexion$/i', $erreur) ? 'mort' : 'refuse';
    if ($code >= 200 && $code < 300) return 'ok';
    if ($code === 404 || $code === 410) return 'mort';
    return 'refuse';
}

/** Sonde une adresse. Rend [code|null, hote_final, erreur]. */
function lf_sonder(string $url): array {
    if (!preg_match('~^https?://~i', $url)) $url = 'https://' . $url;
    $hote = (string)parse_url($url, PHP_URL_HOST);
    if ($hote === '' || !(@checkdnsrr($hote, 'A') || @checkdnsrr($hote, 'AAAA'))) {
        return [null, $hote, 'dns'];
    }
    $ch = curl_init($url);
    curl_setopt_array($ch, [
        CURLOPT_NOBODY => false, CURLOPT_RETURNTRANSFER => true, CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_MAXREDIRS => 8, CURLOPT_CONNECTTIMEOUT => LOUNGES_DELAI_S, CURLOPT_TIMEOUT => LOUNGES_DELAI_S,
        CURLOPT_SSL_VERIFYPEER => false, CURLOPT_SSL_VERIFYHOST => 0,
        CURLOPT_USERAGENT => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) CigarOdyssey-atlas/1.0',
        CURLOPT_RANGE => '0-2048',
        // HTTP/1.1 force : des serveurs coupent un flux HTTP/2 en plein
        // milieu (INTERNAL_ERROR), et la sonde prenait ce bruit de
        // transport pour un site mort.
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    ]);
    curl_exec($ch);
    $code = (int)curl_getinfo($ch, CURLINFO_RESPONSE_CODE);
    $final = (string)parse_url((string)curl_getinfo($ch, CURLINFO_EFFECTIVE_URL), PHP_URL_HOST);
    $err = curl_error($ch);
    curl_close($ch);
    // Un serveur qui ignore Range repond 200 au lieu de 206 : les deux
    // sont « ok ». Un 206 est ramene a 200 pour la lecture.
    if ($code === 206) $code = 200;
    if ($code === 0) return [null, $final ?: $hote, $err ?: 'connexion'];
    return [$code, $final ?: $hote, ''];
}

/** Le sceau des sondes, ou [] s'il n'existe pas. */
function lf_sondes(): array {
    if (!is_file(LOUNGES_SONDES)) return [];
    $d = json_decode((string)file_get_contents(LOUNGES_SONDES), true);
    return is_array($d) && isset($d['sondes']) ? $d['sondes'] : [];
}

/**
 * L'etat d'une fiche, et ce qu'il faut en faire.
 *
 * A RELIRE quand :
 *   · la source est « a verifier » ou faible — rien ne dit que le lieu
 *     est ouvert ;
 *   · le site cite est mort — le lieu a peut-etre ferme, ou change
 *     d'adresse ; les deux meritent qu'on cherche.
 * Une source de reseau non datee n'est pas « a relire » ici : elle se
 * recoupe en bloc, contre l'annuaire du reseau, pas fiche par fiche.
 * Une fiche « a verifier » RELUE a une date ecrite ne l'est pas non plus,
 * pendant dix-huit mois : on ne recommence pas chaque semaine une
 * recherche qui n'a rien rendu. Passe ce delai, elle revient.
 */
function lf_etat(array $r, array $sondes): array {
    $classe = lf_classe_source((string)$r['source']);
    $annee  = lf_annee_source((string)$r['source']);
    $site   = trim((string)($r['website'] ?? ''));
    $sonde  = $site !== '' ? ($sondes[(string)$r['id']] ?? null) : null;
    $http   = $sonde['verdict'] ?? ($site !== '' ? 'non_sondee' : 'sans_site');
    $raisons = [];
    if ($classe === 'a_verifier') $raisons[] = 'source déclarée absente';
    if ($classe === 'relue') {
        $age = lf_mois_depuis_relecture((string)$r['source'], $r['_aujourdhui'] ?? null);
        if ($age === null || $age > LOUNGES_RELECTURE_MOIS) $raisons[] = 'relecture de plus de ' . LOUNGES_RELECTURE_MOIS . ' mois';
    }
    if ($classe === 'faible')     $raisons[] = 'source faible (' . trim((string)$r['source']) . ')';
    if ($http === 'mort')         $raisons[] = 'site mort (' . ($sonde['detail'] ?? '') . ')';
    return ['classe' => $classe, 'annee' => $annee, 'http' => $http,
            'a_relire' => $raisons !== [], 'raisons' => $raisons];
}

/* ── Les cas construits ────────────────────────────────── */
function lf_autotest(): int {
    $echecs = 0;
    $dire = function (bool $ok, string $titre, string $detail = '') use (&$echecs) {
        if (!$ok) $echecs++;
        printf("  [%s] %-58s %s\n", $ok ? 'ok' : 'KO', $titre, $detail);
    };
    $dire(lf_classe_source('à vérifier — l\'hôtel existe, son salon cigares n\'est recoupé nulle part') === 'a_verifier', 'classe : « à vérifier » est declaree absente');
    $dire(lf_classe_source('') === 'a_verifier', 'classe : le vide est une absence');
    $dire(lf_classe_source('à vérifier — relu le 17 septembre 2026 : l\'hôtel existe (azalai.com), son salon cigares n\'est décrit nulle part') === 'relue', 'classe : une relecture datee se reconnait');
    $dire(lf_classe_source('fourni par l\'établissement — relu le 17 septembre 2026 : son compte Instagram donne les deux adresses') === 'relue', 'classe : une source faible relue et datee est relue');
    $dire(lf_classe_source('lacavadelpuro.com (lu le 17 septembre 2026 : adresses, horaires)') === 'sourcee', 'classe : un site officiel lu et date reste une source');
    $dire(lf_mois_depuis_relecture('à vérifier — relu le 17 septembre 2026 : rien', '2027-01-20') === 4, 'relecture : quatre mois apres');
    $dire(lf_mois_depuis_relecture('à vérifier — relu le 1er août 2026 : rien', '2028-03-01') === 19, 'relecture : le 1er aout se lit');
    $dire(lf_mois_depuis_relecture('à vérifier — sans date') === null, 'relecture : sans date, null');
    $dire(lf_classe_source('Google Maps') === 'faible', 'classe : Google Maps seul est faible');
    $dire(lf_classe_source('TripAdvisor') === 'faible', 'classe : TripAdvisor seul est faible');
    $dire(lf_classe_source('maisondelatruffe.com, Google Maps') === 'sourcee', 'classe : un site officiel plus Google Maps reste source');
    $dire(lf_classe_source('PDF officiel Habanos S.A.') === 'reseau', 'classe : l annuaire Habanos est un reseau');
    $dire(lf_classe_source('davidoff.com') === 'reseau', 'classe : davidoff.com est un reseau');
    $dire(lf_classe_source('cigarjournal.com Golden Band Awards 2021') === 'sourcee', 'classe : la presse du metier est une source');
    $dire(lf_classe_source('RETIRÉ — l\'annuaire du réseau ne place aucune Casa del Habano dans cette ville') === 'retiree', 'classe : une fiche retiree se reconnait');
    $dire(lf_annee_source('habanos.com officiel 2025') === 2025, 'annee : 2025 est lue');
    $dire(lf_annee_source('Civette fondée en 1787, site officiel') === null, 'annee : 1787 n est pas une date de source');
    $dire(lf_annee_source('cigarjournal.com 2021, relu 2024') === 2024, 'annee : la plus recente est retenue');
    $dire(lf_verdict_http(200, true) === 'ok', 'http : 200 est ok');
    $dire(lf_verdict_http(404, true) === 'mort', 'http : 404 est mort');
    $dire(lf_verdict_http(410, true) === 'mort', 'http : 410 est mort');
    $dire(lf_verdict_http(403, true) === 'refuse', 'http : 403 est refuse, pas mort');
    $dire(lf_verdict_http(503, true) === 'refuse', 'http : 503 est refuse, pas mort');
    $dire(lf_verdict_http(null, false) === 'mort', 'http : un nom qui ne resout pas est mort');
    $dire(lf_verdict_http(null, true, 'Failed to connect to x port 443: Connection refused') === 'mort', 'http : une connexion refusee est morte');
    $dire(lf_verdict_http(null, true, 'HTTP/2 stream 1 was not closed cleanly') === 'refuse', 'http : un transport qui casse n est pas un site mort');
    $e = lf_etat(['id' => 1, 'source' => 'Google Maps', 'website' => ''], []);
    $dire($e['a_relire'] && $e['http'] === 'sans_site', 'etat : source faible sans site est a relire');
    $e = lf_etat(['id' => 2, 'source' => 'davidoff.com', 'website' => 'https://x.example'], ['2' => ['verdict' => 'mort', 'detail' => 'dns']]);
    $dire($e['a_relire'] && $e['raisons'][0] === 'site mort (dns)', 'etat : site mort est a relire, meme avec un reseau');
    $e = lf_etat(['id' => 3, 'source' => 'PDF officiel Habanos S.A.', 'website' => ''], []);
    $dire(!$e['a_relire'] && $e['classe'] === 'reseau', 'etat : un reseau non date n est pas a relire ici');
    $e = lf_etat(['id' => 4, 'source' => 'kempinski.com', 'website' => 'https://y.example'], ['4' => ['verdict' => 'refuse', 'detail' => '403']]);
    $dire(!$e['a_relire'], 'etat : un site qui refuse n est pas a relire');
    $e = lf_etat(['id' => 5, 'source' => 'à vérifier — relu le 17 septembre 2026 : rien', 'website' => '', '_aujourdhui' => '2027-06-01'], []);
    $dire(!$e['a_relire'] && $e['classe'] === 'relue', 'etat : relue il y a huit mois, pas a relire');
    $e = lf_etat(['id' => 6, 'source' => 'à vérifier — relu le 17 septembre 2026 : rien', 'website' => '', '_aujourdhui' => '2028-06-01'], []);
    $dire($e['a_relire'] && $e['raisons'][0] === 'relecture de plus de 18 mois', 'etat : relue il y a vingt mois, a relire');
    printf("\n  %d cas, %d echec(s)\n", 32, $echecs);
    return $echecs === 0 ? 0 : 1;
}

/* ── Programme ─────────────────────────────────────────── */
if (PHP_SAPI !== 'cli' || defined('LOUNGES_INCLUDE')) return;

if (in_array('--autotest', $argv, true)) exit(lf_autotest());

$db = getDB();
$pays = null;
foreach ($argv as $a) if (str_starts_with($a, '--pays=')) $pays = substr($a, 7);

$sql = "SELECT id, country_id, name, city, type, source, website, updated_at
          FROM lounges WHERE is_verified = 1" . ($pays ? " AND country_id = " . $db->quote($pays) : '') . "
      ORDER BY country_id, id";
$fiches = $db->query($sql)->fetchAll(PDO::FETCH_ASSOC);

// ── Sonder : le reseau, et le sceau ──────────────────────
if (in_array('--sonder', $argv, true)) {
    // LE RESEAU D'ABORD. Une machine mise en veille au milieu d'une sonde
    // a rendu cinq « mort (dns) » pour des sites vivants, et le sceau les
    // a pris pour argent comptant. Deux noms qu'on sait vivants servent
    // de temoins : s'ils ne resolvent pas, ce n'est pas le lieu qui est
    // mort, c'est la ligne — on n'ecrit rien.
    foreach (['habanos.com', 'cloudflare.com'] as $temoin) {
        if (!@checkdnsrr($temoin, 'A')) { fwrite(STDERR, "Réseau indisponible ($temoin ne résout pas) : sondes non écrites.\n"); exit(2); }
    }
    $sondes = lf_sondes();
    $n = 0;
    foreach ($fiches as $r) {
        $site = trim((string)$r['website']);
        if ($site === '') continue;
        [$code, $final, $err] = lf_sonder($site);
        $verdict = lf_verdict_http($code, $err !== 'dns', $err);
        $sondes[(string)$r['id']] = ['site' => $site, 'code' => $code, 'final' => $final,
            'verdict' => $verdict, 'detail' => $err !== '' ? $err : (string)$code, 'date' => date('Y-m-d')];
        printf("  #%-5d %-8s %-38s %s\n", $r['id'], $verdict, mb_strimwidth($r['name'], 0, 38, '…'), $err !== '' ? $err : (string)$code);
        $n++;
    }
    // Et le reseau a la fin : plus d'un tiers de « dns » d'un coup, c'est
    // la ligne qui a lache en route, pas un tiers des lieux.
    $dns = count(array_filter($sondes, fn($s) => ($s['detail'] ?? '') === 'dns' && ($s['date'] ?? '') === date('Y-m-d')));
    if ($n > 3 && $dns * 3 > $n) { fwrite(STDERR, "$dns noms sur $n ne résolvent pas : réseau douteux, sondes non écrites.\n"); exit(2); }
    ksort($sondes, SORT_NUMERIC);
    file_put_contents(LOUNGES_SONDES, json_encode(['date' => date('Y-m-d'), 'sondes' => $sondes],
        JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE) . "\n");
    printf("\nSondes écrites : %d sites, sql/lounges_sondes.json\n", $n);
    exit(0);
}

// ── L'etat ────────────────────────────────────────────────
$sondes = lf_sondes();
$parClasse = []; $parHttp = []; $aRelire = []; $parPays = [];
foreach ($fiches as $r) {
    $e = lf_etat($r, $sondes);
    $parClasse[$e['classe']] = ($parClasse[$e['classe']] ?? 0) + 1;
    $parHttp[$e['http']]     = ($parHttp[$e['http']] ?? 0) + 1;
    if ($e['a_relire']) {
        $aRelire[] = ['id' => (int)$r['id'], 'pays' => $r['country_id'], 'nom' => $r['name'], 'raisons' => $e['raisons']];
        $parPays[$r['country_id']] = ($parPays[$r['country_id']] ?? 0) + 1;
    }
}

if (in_array('--verifier', $argv, true)) {
    // LE CLIQUET, hors ligne : le nombre de fiches a relire ne doit pas
    // remonter, et aucune fiche publiable ne doit citer un site que la
    // sonde a vu mort sans qu'on l'ait relue depuis.
    $sceau = is_file(LOUNGES_SCEAU) ? json_decode((string)file_get_contents(LOUNGES_SCEAU), true) : null;
    if (!is_array($sceau)) { echo "Aucun sceau. Lancer sans option puis --figer.\n"; exit(1); }
    $code = 0;
    if (count($aRelire) > (int)$sceau['a_relire']) {
        printf("  ECHEC  %d fiches a relire, le sceau en admet %d\n", count($aRelire), $sceau['a_relire']);
        $code = 1;
    }
    $morts = array_filter($aRelire, fn($f) => (bool)preg_grep('/^site mort/', $f['raisons']));
    if (count($morts) > (int)$sceau['sites_morts']) {
        printf("  ECHEC  %d sites morts, le sceau en admet %d\n", count($morts), $sceau['sites_morts']);
        $code = 1;
    }
    if ($code === 0) printf("  %d a relire (sceau %d), %d sites morts (sceau %d) : rien de nouveau.\n",
                            count($aRelire), $sceau['a_relire'], count($morts), $sceau['sites_morts']);
    exit($code);
}

printf("\nFRAÎCHEUR DES ÉTABLISSEMENTS — %d fiches publiables%s\n", count($fiches), $pays ? " ($pays)" : '');
echo str_repeat('═', 76), "\n";
echo "  Source :  ";
foreach (['sourcee' => 'sourcée', 'reseau' => 'réseau', 'faible' => 'faible', 'a_verifier' => 'à vérifier', 'relue' => 'relue'] as $k => $lib) {
    printf("%s %d   ", $lib, $parClasse[$k] ?? 0);
}
echo "\n  Site :    ";
foreach (['ok' => 'répond', 'refuse' => 'refuse', 'mort' => 'mort', 'non_sondee' => 'non sondé', 'sans_site' => 'sans site'] as $k => $lib) {
    printf("%s %d   ", $lib, $parHttp[$k] ?? 0);
}
printf("\n\n  À RELIRE : %d fiches\n", count($aRelire));
arsort($parPays);
foreach ($parPays as $p => $n) printf("    %-14s %d\n", $p, $n);
echo "\n";
foreach ($aRelire as $f) {
    printf("  #%-5d %-12s %-40s %s\n", $f['id'], $f['pays'], mb_strimwidth($f['nom'], 0, 40, '…'), implode(' ; ', $f['raisons']));
}

if (in_array('--figer', $argv, true)) {
    file_put_contents(LOUNGES_SCEAU, json_encode(['date' => date('Y-m-d'), 'publiables' => count($fiches),
        'a_relire' => count($aRelire), 'sites_morts' => count(array_filter($aRelire, fn($f) => (bool)preg_grep('/^site mort/', $f['raisons'])))],
        JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n");
    echo "\nSceau écrit : sql/lounges_fraicheur.json\n";
}
