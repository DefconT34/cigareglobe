<?php
// ════════════════════════════════════════════════════════
// vignettes.php — L'image qu'on voit AVANT de cliquer
// ────────────────────────────────────────────────────────
// LE CONSTAT. Les 738 pages du site déclaraient toutes la même balise
// `og:image`, vers `/og-image.jpg`. Ce fichier N'EXISTE PAS : ni dans
// le dépôt, ni sur le serveur, où il répond 404.
//
// Autrement dit, depuis le premier jour, chaque lien de ce site partagé
// sur WhatsApp, LinkedIn, X ou Slack affichait une carte SANS IMAGE. Et
// rien ne pouvait le signaler : une balise qui pointe dans le vide est
// une balise parfaitement valide.
//
// ── CE QUE CET OUTIL FABRIQUE ───────────────────────────
// Les mêmes cartes que `placeholders.php` — dont il réemploie le
// dessin, la palette et la police — mais au format des réseaux :
// 1200 × 630, la proportion 1,91:1 qu'attendent les cartes larges.
//
//   uploads/og/defaut.jpg          le repli, pour toute page sans carte
//   uploads/og/marque-<slug>.jpg   une par maison
//   uploads/og/pays-<id>.jpg       une par pays ayant une page
//
// Les ÉTABLISSEMENTS n'en ont pas besoin : ils ont déjà leur carte
// dans `uploads/lounges/<id>/`, faite par placeholders.php. On ne la
// refait pas — et surtout on ne l'écrase pas, car l'une d'elles est une
// VRAIE PHOTOGRAPHIE (la façade du lounge d'Abidjan).
//
// ── ⚠ À LANCER SUR LE SERVEUR, PAS SEULEMENT ICI ────────
// `uploads/` est exclu du déploiement (voir .cpanel.yml) : les octets ne
// voyagent pas avec le code. Une carte engendrée sur le poste de
// développement n'existera JAMAIS en production.
//
// C'est exactement le piège dans lequel `/og-image.jpg` est tombé, et
// c'est pourquoi le rendu vérifie l'existence du fichier avant de poser
// la balise : sans carte, aucune balise — jamais un lien mort.
//
// USAGE
//   php tools/vignettes.php --autotest
//   php tools/vignettes.php --defaut          seulement la carte de repli
//   php tools/vignettes.php --tout            tout ce qui manque
//   php tools/vignettes.php --tout --forcer   même ce qui existe déjà
//   php tools/vignettes.php --une=padron      une carte, pour voir
//   php tools/vignettes.php --pays            refait les cartes de pays
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

define('PLACEHOLDERS_INCLUDE', true);
require_once __DIR__ . '/placeholders.php';
require_once __DIR__ . '/../backend/pages_lib.php';

const VG_RACINE = __DIR__ . '/../uploads/og';
const VG_L      = 1200;   // la largeur qu'attendent les cartes larges
const VG_H      = 630;    // 1,91:1

/**
 * Écrit une carte. Renvoie le chemin, ou null si rien n'a été fait.
 *
 * `ph_carte()` vient de placeholders.php et prend n'importe quelle
 * taille : la vignette n'est pas la carte agrandie, le dessin se
 * remet à l'échelle. On ne réécrit pas ce code — un second dessin
 * aurait fini par diverger du premier, et deux chartes graphiques pour
 * un même site est exactement ce qu'on ne veut pas.
 */
function vg_ecrire(array $fiche, string $nom, bool $forcer): ?string {
    if (!is_dir(VG_RACINE) && !mkdir(VG_RACINE, 0755, true)) {
        throw new RuntimeException('dossier impossible : ' . VG_RACINE);
    }
    $chemin = VG_RACINE . '/' . $nom;
    if (is_file($chemin) && !$forcer) return null;
    $im = ph_carte($fiche, VG_L, VG_H);
    imagejpeg($im, $chemin, 86);
    imagedestroy($im);
    return $chemin;
}

/** Les maisons : le nom, le pays, et la ville quand `founded` en porte une. */
function vg_marques(PDO $db): array {
    $sql = "SELECT b.name,
                   COALESCE(pc.name, lc.name, '') AS pays,
                   b.founded
              FROM brands b
         LEFT JOIN producer_countries pc ON pc.id = b.country_id
         LEFT JOIN lounge_countries   lc ON lc.id = b.country_id
          ORDER BY b.name";
    $out = [];
    foreach ($db->query($sql) as $r) {
        // `founded` s'écrit « 1902 — La Havane, Cuba ». La carte affiche
        // la ligne du dessous : on prend ce qui suit le tiret cadratin,
        // et rien s'il n'y en a pas — une carte qui répète le pays deux
        // fois ne dit rien de plus.
        $sous = '';
        $f = (string)$r['founded'];
        if (str_contains($f, '—')) $sous = trim(explode('—', $f, 2)[1]);
        if ($sous !== '' && mb_strlen($sous) > 40) $sous = trim(explode(',', $sous)[0]);
        $out[] = ['name' => $r['name'], 'ville' => $sous, 'pays' => $r['pays']];
    }
    return $out;
}

/**
 * Les pays qui ont une page — producteurs et pays d'adresses.
 *
 * ── POURQUOI CETTE CARTE NE SE FAIT PAS COMME LES AUTRES ─
 * Le dessin vient des ETABLISSEMENTS : ligne du haut le nom du lieu,
 * ligne du bas le pays. Pour un pays, les deux sont la meme chose — la
 * premiere carte de Cuba portait « Cuba » en titre et « C U B A » en
 * bas. Un doublon sur la seule image que verra celui qui n'a pas encore
 * clique.
 *
 * On remplit donc les deux lignes avec ce que l'atlas SAIT du pays :
 * combien de maisons et combien de caves il y porte, et de quel genre
 * de pays il s'agit. Deux cartes de pays ne se ressemblent plus, et
 * chacune dit quelque chose.
 */
function vg_pays(PDO $db): array {
    $ok  = PAGE_FICHE_PUBLIABLE;
    $sql = "SELECT c.id, c.name, 1 AS producteur,
                   (SELECT COUNT(*) FROM brands  b WHERE b.country_id = c.id) AS maisons,
                   (SELECT COUNT(*) FROM lounges l WHERE l.country_id = c.id AND l.$ok) AS caves
              FROM producer_countries c
            UNION
            SELECT lc.id, lc.name, 0,
                   (SELECT COUNT(*) FROM brands  b WHERE b.country_id = lc.id),
                   (SELECT COUNT(*) FROM lounges l WHERE l.country_id = lc.id AND l.$ok)
              FROM lounge_countries lc
             WHERE lc.id NOT IN (SELECT id FROM producer_countries)
             ORDER BY name";
    $out = [];
    foreach ($db->query($sql) as $r) {
        $out[] = [
            'id'    => $r['id'],
            'name'  => $r['name'],
            'ville' => vg_compte((int)$r['maisons'], (int)$r['caves']),
            'pays'  => ((int)$r['producteur'] === 1) ? 'PAYS PRODUCTEUR' : 'CAVES ET LOUNGES',
        ];
    }
    return $out;
}

/**
 * « 27 maisons · 12 caves », et rien quand il n'y a rien.
 *
 * Le singulier n'est pas une coquetterie : « 1 maisons » sur une carte
 * de partage se voit, et se voit longtemps — ces images sont mises en
 * cache par les reseaux et ne se corrigent pas d'un deploiement.
 */
function vg_compte(int $maisons, int $caves): string {
    $bouts = [];
    if ($maisons > 0) $bouts[] = $maisons . ' maison' . ($maisons > 1 ? 's' : '');
    if ($caves   > 0) $bouts[] = $caves   . ' cave'   . ($caves   > 1 ? 's' : '');
    return implode(' · ', $bouts);
}

/**
 * Les cas construits.
 *
 * Ils portent sur la seule chose que cet outil décide vraiment : quel
 * texte va sur la carte. Le dessin, lui, est déjà éprouvé par
 * l'autotest de placeholders.php — on ne le teste pas deux fois.
 */
function vg_autotest(): int {
    $echecs = 0;
    $dire = function (bool $ok, string $titre, string $obtenu = '') use (&$echecs) {
        if ($ok) { printf("  [ok] %s\n", $titre); return; }
        printf("  ECHEC %s %s\n", $titre, $obtenu); $echecs++;
    };

    // Le nom de fichier vient du slug, donc des mêmes règles que
    // l'adresse de la page : « Partagás » doit donner « partagas », sans
    // quoi la page chercherait une carte que l'outil n'a pas écrite.
    $dire(page_vignette_nom('marque', 'Partagás') === 'uploads/og/marque-partagas.jpg',
          'nom : les accents tombent comme dans l adresse',
          page_vignette_nom('marque', 'Partagás'));
    $dire(page_vignette_nom('marque', 'Cornelius & Anthony') === 'uploads/og/marque-cornelius-anthony.jpg',
          'nom : l esperluette aussi');
    $dire(page_vignette_nom('pays', 'costarica') === 'uploads/og/pays-costarica.jpg',
          'nom : un pays garde son identifiant');

    // ── LA RÈGLE QUI VIENT DU DÉFAUT ────────────────────
    // Aucune balise si le fichier n'existe pas. C'est ce qui empêche de
    // refaire /og-image.jpg : une image déclarée et absente.
    $dire(page_vignette(['uploads/og/ceci-nexiste-pas.jpg']) === null,
          'rendu : un fichier absent ne donne AUCUNE balise');
    $dire(page_vignette(['uploads/og/ceci-nexiste-pas.jpg', 'tools/vignettes.php']) === '/tools/vignettes.php',
          'rendu : le premier candidat qui existe l emporte');
    $dire(page_vignette([]) === null, 'rendu : sans candidat, rien');
    $dire(page_vignette(['', '   ']) === null, 'rendu : des candidats vides ne comptent pas');

    // Le sous-titre d'une maison se tire de `founded`.
    $f = fn($s) => (function (string $founded): string {
        $sous = '';
        if (str_contains($founded, '—')) $sous = trim(explode('—', $founded, 2)[1]);
        if ($sous !== '' && mb_strlen($sous) > 40) $sous = trim(explode(',', $sous)[0]);
        return $sous;
    })($s);
    $dire($f('1902 — La Havane, Cuba') === 'La Havane, Cuba', 'sous-titre : ce qui suit le tiret');
    $dire($f('1912') === '', 'sous-titre : rien quand il n y a pas de tiret');

    // ── LE COMPTE D'UN PAYS ─────────────────────────────
    // Le singulier n'est pas une coquetterie : « 1 maisons » sur une
    // carte de partage se voit longtemps, parce que les reseaux mettent
    // ces images en cache et qu'un deploiement ne les corrige pas.
    $dire(vg_compte(27, 12) === '27 maisons · 12 caves', 'compte : les deux', vg_compte(27,12));
    $dire(vg_compte(1, 0)   === '1 maison',  'compte : une seule maison', vg_compte(1,0));
    $dire(vg_compte(0, 1)   === '1 cave',    'compte : une seule cave',   vg_compte(0,1));
    $dire(vg_compte(0, 0)   === '',          'compte : rien quand il n y a rien');
    $dire(vg_compte(2, 0)   === '2 maisons', 'compte : pluriel sans caves');

    // ── ET LE DOUBLON QUI A OUVERT CETTE REPRISE ────────
    // La carte de Cuba portait « Cuba » en titre ET « C U B A » en bas.
    // ph_ville() efface le sous-titre quand il repete le nom ou le pays :
    // c'est la garde qui empeche le doublon de revenir.
    $dire(ph_ville('Cuba', 'Cuba', 'Cuba') === '', 'doublon : un sous-titre qui repete le nom disparait');
    $dire(ph_ville('Cuba', '27 maisons · 12 caves', 'PAYS PRODUCTEUR') === '27 maisons · 12 caves',
          'doublon : un compte, lui, reste');

    printf("\nvignettes --autotest : %d echec(s)\n", $echecs);
    return $echecs === 0 ? 0 : 1;
}

if (in_array('--autotest', $argv, true)) exit(vg_autotest());

// ── Fabrication ──────────────────────────────────────────
$forcer = in_array('--forcer', $argv, true);
$db = getDB();
$faits = 0; $sautes = 0;

$une = null;
foreach ($argv as $a) if (str_starts_with($a, '--une=')) $une = substr($a, 6);

// La carte de repli : celle que servira toute page sans carte propre.
if (in_array('--defaut', $argv, true) || in_array('--tout', $argv, true)) {
    $c = vg_ecrire(['name' => 'CigarOdyssey', 'ville' => "L'atlas mondial du cigare premium",
                    'pays' => ''], 'defaut.jpg', $forcer);
    $c === null ? $sautes++ : $faits++;
    echo $c === null ? "  defaut.jpg — deja la\n" : "  defaut.jpg — ecrite\n";
}

if (in_array('--pays', $argv, true)) {
    foreach (vg_pays($db) as $p) {
        $nom = basename(page_vignette_nom('pays', (string)$p['id']));
        vg_ecrire($p, $nom, true) === null ? $sautes++ : $faits++;   // --pays refait toujours
    }
}

if (in_array('--tout', $argv, true) || $une !== null) {
    foreach (vg_marques($db) as $m) {
        $nom = basename(page_vignette_nom('marque', $m['name']));
        if ($une !== null && $nom !== 'marque-' . $une . '.jpg') continue;
        vg_ecrire($m, $nom, $forcer) === null ? $sautes++ : $faits++;
    }
    if ($une === null) {
        foreach (vg_pays($db) as $p) {
            $nom = basename(page_vignette_nom('pays', (string)$p['id']));
            vg_ecrire($p, $nom, $forcer) === null ? $sautes++ : $faits++;
        }
    }
}

if ($faits === 0 && $sautes === 0) {
    echo "Rien demande. Voir --tout, --defaut, --une=<slug>, --autotest.\n";
    exit(0);
}
printf("\n%d carte(s) ecrite(s), %d deja a jour.\n", $faits, $sautes);
echo "⚠ uploads/ ne se deploie pas : relancer cet outil SUR LE SERVEUR.\n";
