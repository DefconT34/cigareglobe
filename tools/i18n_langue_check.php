<?php
// ════════════════════════════════════════════════════════
// tools/i18n_langue_check.php — Une traduction dans SA langue
// ────────────────────────────────────────────────────────
// LE DEFAUT. Des colonnes espagnoles, allemandes, chinoises et arabes
// contiennent de l'ANGLAIS. Pas une bribe : le texte anglais entier,
// recopie tel quel dans les quatre langues. La colonne `gamme_es`
// d'Alec Bradley commence par « #1 Cigar of the Year Cigar Aficionado
// 2011. Score 96. Box-pressed Torpedo… ».
//
// ── POURQUOI AUCUN COMPTEUR NE LE VOYAIT ────────────────
//
// `i18n_fraicheur` compte les cases REMPLIES et verifie de quel francais
// elles derivent. Une case remplie d'anglais est remplie. Elle est meme
// scellee sur le bon francais — la traduction existe, elle est juste
// dans la mauvaise langue.
//
// C'est le meme aveuglement que partout ailleurs dans ce projet : le
// compteur mesure la presence, pas la justesse. « 100 % traduit » etait
// vrai et ne disait rien.
//
// ── LA MESURE ───────────────────────────────────────────
//
// On cherche des mots outils anglais — the, and, with, which, from… —
// frequents, sans ambiguite, et absents du francais, de l'espagnol et de
// l'allemand. Le seuil de trois occurrences evite les emprunts isoles
// (« box-pressed », « blend ») qui sont du vocabulaire de metier.
//
// Le francais sert de TEMOIN : mesure sur lui, le detecteur doit rendre
// un taux proche de zero. S'il monte, c'est le detecteur qui est faux,
// pas les donnees.
//
// ── LE CLIQUET ──────────────────────────────────────────
//
// 164 elements sont concernes au moment ou ce controle est ecrit. Les
// corriger demande environ 131 000 caracteres de traduction : c'est un
// chantier de plusieurs passes, pas d'une.
//
// La liste des elements fautifs est donc enregistree dans
// tools/i18n_langue_baseline.json. Le controle echoue si un element
// NOUVEAU apparait, et rappelle a chaque passage combien il en reste.
// Le compte ne peut que descendre — c'est la meme discipline que
// tests/e2e/i18n-baseline.json.
//
//   php tools/i18n_langue_check.php              # controler
//   php tools/i18n_langue_check.php --figer      # reecrire la reference
//
// Appele par tests/run.php.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';
require_once __DIR__ . '/i18n_contenu_plan.php';

const MOTS_ANGLAIS = '/\b(the|and|with|which|from|this|that|these|those|their|its|was|were|'
                   . 'have|has|been|launched|wrapper|filler|binder|blend|notes of|aged|years)\b/i';
const SEUIL = 3;

/** Les champs JSON dont chaque element porte un texte traduit. */
function champs_items(): array {
    return ['gamme' => 'story', 'celebrities' => 'anecdote', 'pairings' => 'notes'];
}

/**
 * Releve tous les elements dont le texte est de l'anglais.
 * @return array<string,true> cles « table.champ.lang#cle_ligne[index] »
 */
function releve(PDO $db, string $langue): array {
    $out = [];
    foreach (champs_items() as $champ => $cle) {
        $col = $champ . '_' . $langue;
        try { $q = $db->query("SELECT name, `$col` v FROM brands
                                WHERE `$col` IS NOT NULL AND `$col` <> '[]'"); }
        catch (Throwable $e) { continue; }
        foreach ($q as $r) {
            foreach (json_decode((string)$r['v'], true) ?: [] as $i => $item) {
                $t = (string)($item[$cle] ?? '');
                if ($t === '') continue;
                // Deux symptomes du meme mal : la colonne porte autre
                // chose que sa langue. Soit on y reconnait de l'anglais,
                // soit — pour le chinois et l'arabe — l'ecriture attendue
                // en est absente, ce qui suffit a conclure sans compter
                // un seul mot.
                $anglais = preg_match_all(MOTS_ANGLAIS, $t, $m) && count($m[0]) >= SEUIL;
                if ($anglais || !ecriture_attendue($langue, $t)) {
                    $out["brands.$champ.$langue#{$r['name']}[$i]"] = true;
                }
            }
        }
    }
    return $out;
}

// ── Les alphabets ───────────────────────────────────────
//
// CE QUE CE CONTRÔLE ATTRAPE, ET QUE LE PRÉCÉDENT NE VOIT PAS.
// En rédigeant une traduction chinoise, du CYRILLIQUE s'est glissé au
// milieu d'une phrase : « 卡马乔想показ示自己能走多浓时 ». Un mélange
// russe-chinois qu'aucune étape de la chaîne n'aurait signalé.
//
// `i18n_fraicheur` compte les cases pleines : celle-ci l'était.
// La mesure de mots anglais ci-dessus cherche de l'anglais : il n'y en
// avait pas. Et le français, lui, était juste.
//
// Les six langues du site n'emploient que TROIS écritures : latine,
// han, arabe. Toute autre est nécessairement une faute de saisie — un
// copier-coller malheureux, un clavier resté dans une autre
// disposition. Il n'y a donc pas de seuil à régler ni de cliquet à
// poser : zéro est la seule valeur acceptable, et la base en est
// aujourd'hui à zéro.
const ECRITURES_ETRANGERES = [
    'cyrillique' => '\x{0400}-\x{04FF}',
    'grec'       => '\x{0370}-\x{03FF}',
    'hébreu'     => '\x{0590}-\x{05FF}',
    'arménien'   => '\x{0530}-\x{058F}',
    'géorgien'   => '\x{10A0}-\x{10FF}',
    'devanagari' => '\x{0900}-\x{097F}',
    'thaï'       => '\x{0E00}-\x{0E7F}',
    'hangul'     => '\x{AC00}-\x{D7AF}',
    'kana'       => '\x{3040}-\x{30FF}',
];

/**
 * Écritures étrangères présentes dans un texte.
 * @return array<string,string> nom de l'écriture → extrait fautif
 */
function ecritures_etrangeres(string $t): array {
    $out = [];
    foreach (ECRITURES_ETRANGERES as $nom => $plage) {
        if (preg_match_all('/[' . $plage . ']+/u', $t, $m)) {
            $out[$nom] = implode(', ', array_slice(array_unique($m[0]), 0, 3));
        }
    }
    return $out;
}

/**
 * Une colonne chinoise doit contenir du han, une colonne arabe de
 * l'arabe. Sinon elle porte autre chose que ce qu'elle annonce — c'est
 * le cas de la fuite d'anglais, mais aussi d'une case remplie par
 * erreur avec le texte d'une autre langue.
 */
function ecriture_attendue(string $langue, string $t): bool {
    // Les textes tres courts (un nom propre seul) echappent a la regle :
    // « Toscanello » est une reponse valide en chinois comme en arabe.
    if (mb_strlen(trim($t)) < 12) return true;
    return match ($langue) {
        'zh' => (bool)preg_match('/[\x{4E00}-\x{9FFF}]/u', $t),
        'ar' => (bool)preg_match('/[\x{0600}-\x{06FF}]/u', $t),
        default => true,
    };
}

$db = getDB();

// ── Le témoin ───────────────────────────────────────────
// Mesuré sur le français, le détecteur doit être quasi muet. Sinon il
// compte des faux positifs et son verdict ne vaut rien.
$temoin = 0; $totalFr = 0;
foreach (champs_items() as $champ => $cle) {
    foreach ($db->query("SELECT `$champ` v FROM brands WHERE `$champ` IS NOT NULL") as $r) {
        foreach (json_decode((string)$r['v'], true) ?: [] as $item) {
            $t = (string)($item[$cle] ?? '');
            if ($t === '') continue;
            $totalFr++;
            if (preg_match_all(MOTS_ANGLAIS, $t, $m) && count($m[0]) >= SEUIL) $temoin++;
        }
    }
}

$fautifs = [];
foreach (['es', 'de', 'zh', 'ar'] as $l) {
    foreach (releve($db, $l) as $k => $_) $fautifs[$k] = true;
}
ksort($fautifs);

// ── Les écritures, balayées sur TOUTES les colonnes ─────
//
// Y compris le français et l'anglais : une écriture étrangère n'y a pas
// plus sa place qu'ailleurs, et le défaut peut venir de n'importe quel
// côté. Le balayage porte aussi sur les champs qui ne sont pas des
// tableaux — `history`, `caracteres` — puisque la faute de saisie ne
// choisit pas son champ.
require_once __DIR__ . '/i18n_contenu_plan.php';
$ecritures = [];
foreach (plan_contenu() as $table => $champs) {
    foreach ($champs as $ch) {
        foreach (['fr', 'en', 'es', 'de', 'zh', 'ar'] as $l) {
            $col = $l === 'fr' ? $ch : $ch . '_' . $l;
            try { $q = $db->query("SELECT `$col` v FROM `$table` WHERE `$col` IS NOT NULL AND `$col` <> ''"); }
            catch (Throwable $e) { continue; }
            foreach ($q as $r) {
                foreach (ecritures_etrangeres((string)$r['v']) as $nom => $extrait) {
                    $ecritures[] = sprintf('%s.%s (%s) : %s inattendu — « %s »',
                                           $table, $ch, $l, $nom, mb_substr($extrait, 0, 30));
                }
            }
        }
    }
}

// ── Les mots abîmés par une substitution sans limite ────
//
// La migration 095 a trouvé cinq fiches d'établissement dont la colonne
// ANGLAISE disait « First et seule La Casa del Habano du Viandnam ».
// « Viandnam », c'est *Vietnam* où « et » a été remplacé par « and » À
// L'INTÉRIEUR du mot : une substitution posée sans limite de mot.
//
// Aucun contrôle ne pouvait les voir. MOTS_ANGLAIS cherche de l'anglais
// dans les colonnes traduites — ici c'est l'inverse, du FRANÇAIS dans la
// colonne anglaise. Les écritures ne regardent que l'alphabet, et le
// latin est le bon. Et `i18n_fraicheur` affichait 100 % : il compare
// l'empreinte de la source à celle scellée, jamais la traduction à son
// sens.
//
// ── LE TEST QUI TRANCHE ─────────────────────────────────
//
// Chercher « and » collé dans un mot ramène `brands`, `Sandton`,
// `grandfather`, `thousands` : 73 fiches de bruit. Le test est
// RÉVERSIBLE — on remet « et » à la place, et on regarde si le mot
// obtenu figure dans la colonne FRANÇAISE de la même ligne.
//
//     civandte  → civette   present en français  ✓ abimé
//     grandfather → gretfather  absent           ✗ mot légitime
//
// Zéro est la seule valeur acceptable : ce n'est pas un défaut de
// traduction, c'est un texte cassé mécaniquement.
const SUBSTITUTIONS = ['en' => 'and', 'es' => 'y', 'de' => 'und'];

$abimes = [];
foreach (plan_contenu() as $table => $champs) {
    // De quoi nommer la ligne dans le rapport, sans supposer la clé.
    $cle = null;
    foreach (['name', 'id'] as $c) {
        try { $db->query("SELECT `$c` FROM `$table` LIMIT 0"); $cle = $c; break; }
        catch (Throwable $e) { }
    }
    if ($cle === null) continue;

    foreach ($champs as $ch) {
        foreach (SUBSTITUTIONS as $l => $etranger) {
            $col = $ch . '_' . $l;
            try { $q = $db->query("SELECT `$cle` k, `$ch` fr, `$col` tr FROM `$table`
                                    WHERE `$col` IS NOT NULL AND `$col` <> ''
                                      AND `$ch` IS NOT NULL AND `$ch` <> ''"); }
            catch (Throwable $e) { continue; }

            foreach ($q as $r) {
                $fr = mb_strtolower((string)$r['fr']);
                // Le marqueur peut être au MILIEU (« civandte ») ou à la FIN
                // du mot (« discrand », de `discret`). La première version
                // exigeait une lettre des deux côtés et laissait passer le
                // second cas : « Elite Cigar Abidjan » est resté vert avec
                // `discrand`, `discry` et `discrund` dans trois colonnes.
                // On prend donc tout mot qui CONTIENT le marqueur sans s'y
                // réduire, et c'est la réversibilité qui trie.
                if (!preg_match_all('/(?<![\p{L}])\p{L}*' . $etranger . '\p{L}*(?![\p{L}])/u',
                                    (string)$r['tr'], $m)) continue;
                foreach ($m[0] as $mot) {
                    if (mb_strtolower($mot) === $etranger) continue;
                    $nu = trim($mot, ".,;:()[]{}«»\"'\u{2019}");
                    $rendu = mb_strtolower(str_replace($etranger, 'et', $nu));
                    // Deux gardes, sans quoi le test réversible ramène des
                    // mots parfaitement légitimes de la langue cible :
                    //   « brand » → « bret », « land » → « let »,
                    //   « ya » → « eta », « rund » → « ret ».
                    // 1. La forme rendue doit être un MOT ENTIER du français,
                    //    pas un fragment : « civette » l'est, « bret » non.
                    // 2. Elle doit faire au moins cinq lettres. Les vrais cas
                    //    conservent la racine française et la dépassent tous
                    //    (civette, raretés, vietnam, racheté, discret,
                    //    parquet) ; le bruit tient en trois ou quatre.
                    if (mb_strlen($rendu) < 5) continue;
                    if (!preg_match('/(?<![\p{L}\p{N}])' . preg_quote($rendu, '/')
                                    . '(?![\p{L}\p{N}])/u', $fr)) continue;
                    $abimes[] = sprintf('%s.%s (%s) #%s : « %s » — du français « %s » où « et » est devenu « %s »',
                                        $table, $ch, $l, $r['k'], $nu, $rendu, $etranger);
                }
            }
        }
    }
}

$ref = __DIR__ . '/i18n_langue_baseline.json';

if (in_array('--figer', $argv, true)) {
    file_put_contents($ref, json_encode(array_keys($fautifs),
        JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
    printf("%d element(s) enregistre(s) dans %s\n", count($fautifs), basename($ref));
    exit(0);
}

$connus = [];
foreach (json_decode((string)@file_get_contents($ref), true) ?: [] as $k) $connus[$k] = true;

$nouveaux = array_diff_key($fautifs, $connus);
$corriges = array_diff_key($connus, $fautifs);

echo "CigarOdyssey — une traduction dans SA langue\n\n";
printf("  temoin francais : %d / %d elements declencheraient le detecteur",
       $temoin, $totalFr);
echo $temoin > $totalFr * 0.03 ? "  <<< TROP HAUT, le detecteur est suspect\n" : "  (bas, le detecteur tient)\n";
printf("  %d element(s) encore en anglais dans une colonne qui ne l'est pas\n", count($fautifs));
if ($corriges) printf("  %d corrige(s) depuis la derniere reference — penser a --figer\n", count($corriges));
printf("  %d ecriture(s) etrangere(s) — cyrillique, grec, hebreu, thai, kana...\n", count($ecritures));
printf("  %d mot(s) abime(s) par une substitution sans limite de mot\n", count($abimes));

if (!$nouveaux && !$ecritures && !$abimes) {
    echo "\n  Aucun element nouveau, aucune ecriture etrangere, aucun mot abime.\n";
    exit(0);
}

echo "\n";
// Les ecritures etrangeres ne sont PAS au cliquet : les six langues du
// site n'en emploient que trois, donc toute autre est une faute de
// saisie. Zero est la seule valeur acceptable, et la base y est.
foreach ($ecritures as $e) echo "  ECHEC  $e\n";
foreach ($abimes as $a)    echo "  ECHEC  $a\n";
foreach ($nouveaux as $k => $_) echo "  ECHEC  nouvel element en anglais : $k\n";
printf("\n%d element(s) en anglais, %d ecriture(s) etrangere(s), %d mot(s) abime(s).\n",
       count($nouveaux), count($ecritures), count($abimes));
if ($nouveaux) printf("Traduire, ou justifier en mettant a jour %s.\n", basename($ref));
exit(1);
