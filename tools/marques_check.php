<?php
// ════════════════════════════════════════════════════════
// tools/marques_check.php — Ce que les fiches de marques affirment
// ────────────────────────────────────────────────────────
// L'inventaire des fiches de marques a trouvé, sur 116 maisons :
//
//   61 notes chiffrées attribuées à une source nommée, avec année et
//      vitole précises, dont aucune n'était vérifiable ;
//    8 anecdotes mettant une phrase entre guillemets dans la bouche
//      d'une personne réelle, dont une seule était authentique ;
//    4 affirmations sur la consommation de tabac de personnes NOMMÉES
//      ET VIVANTES.
//
// Les migrations 057 et 058 ont traité l'existant. Cet outil empêche le
// stock de se reconstituer.
//
//   php tools/marques_check.php
//
// Sortie 1 dès qu'une affirmation non sourçable réapparaît. Appelé par
// tests/run.php.
//
// ── LE PRINCIPE, EMPRUNTÉ À `rev_detail` ────────────────
//
// Le lot R1 a résolu le même problème pour les montants : un chiffre
// s'affiche AVEC sa base, et `rev_detail` la nomme sous lui. Sans elle,
// 425 M$ et 115 M$ se lisaient comme comparables.
//
// Une note de presse suit la même règle : elle vaut par sa source
// consultable, pas par sa précision. « Cigar Aficionado, 94, 2020 » a
// l'air plus sérieux que « bien noté par la presse » — et l'est moins,
// tant que personne ne peut aller voir.
//
// On exige donc `source_url` sur toute note. La rubrique reste vide en
// attendant, ce qui est l'information juste.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';

// `--autotest` n'ouvre pas la base : il éprouve parole_pretee() sur des
// cas construits. Voir tout en bas du fichier.
$autotest = in_array('--autotest', $argv, true);

$db      = $autotest ? null : getDB();
$defauts = [];
$notes = $anecdotes = $marques = 0;

// Les verbes et tournures qui prêtent une parole. Le test porte sur le
// FRANÇAIS : c'est la colonne source, les autres en dérivent.
//
// LE TROU DE LA PREMIÈRE VERSION. Elle cherchait le verbe AVANT la
// citation — « il aurait dit : '…' ». Bolívar portait la forme inverse,
// « '…', aurait-il dit », et y a survécu. Une anecdote entière est
// passée à travers un contrôle écrit pour elle.
//
// On accepte donc les deux ordres, et le verbe inversé avec son trait
// d'union.
// Un inventaire de verbes est toujours incomplet : « répète-t-il » chez
// Santa Damiana et « en soulignant que » chez Partagás USA introduisaient
// tous deux une citation, et manquaient tous deux a cette liste. C'est
// pour cela que citation_en_soi() ne s'appuie plus dessus.
const VERBES = 'dit|d[ée]clar\w*|d[ée]crivit|confia|affirm\w*|racont\w*|lanç\w*|répondit'
             . '|r[ée]p[èée]t\w*|soulign\w*|expliqu\w*|assur\w*|ajout\w*|r[ée]sum\w*|glissa';
//
// DEUX TROUS DE PLUS, trouves au lot Camacho/CAO/Drew Estate :
//   — le verbe peut etre separe de la citation par une incise
//     (« sa famille dit qu'il etait satisfait — '…' ») ;
//   — une citation peut etre courte (« pour quinze amis »), et le
//     seuil de vingt caracteres la laissait passer.
//
// ── ET LE PIEGE DE L'APOSTROPHE FRANCAISE ───────────────
//
// Elargir le motif a produit quatre FAUX POSITIFS d'un coup : « comme
// l'une des plus belles collaborations de l'industrie » se lit comme une
// citation pour n'importe quel motif naif, puisque `l'` et `l'` encadrent
// du texte.
//
// C'est structurel : en francais l'apostrophe est une marque d'ELISION,
// pas un guillemet. Le discriminant est sa position — une apostrophe
// d'elision est toujours PRECEDEE D'UNE LETTRE (l', d', qu', m', n'),
// tandis qu'une apostrophe ouvrante de citation est precedee d'une
// espace ou d'un signe. Et l'apostrophe fermante d'une citation est
// suivie d'une espace ou d'une ponctuation, jamais d'une lettre.
//
// Le motif exige donc ces deux conditions. Il ne s'agit pas de tolerer
// moins ou plus : il s'agit de reconnaitre ce qu'on cherche.
// Une apostrophe d'ELISION est precedee d'une lettre (l', d', qu', m').
// Une apostrophe de CITATION ne l'est pas. C'est le seul discriminant
// fiable, et il ne tient pas dans un motif unique : l'incise qui separe
// le verbe de la citation peut contenir une elision (« dit qu'il etait
// satisfait — '…' »), et la citation elle-meme aussi (« Mon medecin m'a
// interdit »). On procede donc en deux temps.
// LE DEUX-POINTS ET « COMME » NE SONT PAS DES MARQUEURS DE PAROLE.
//
// Ils y figuraient, et ils produisaient deux faux positifs constants :
//   « L'idée : la 'zone dorée' d'un cigare… »        (Oliva)
//   « considéré comme le meilleur 'petit cigare' »    (Trinidad)
// Dans les deux cas les guillemets entourent un TERME, et le signe qui
// precede n'introduit aucune parole — il introduit une explication.
//
// Ils sont retires. Ce qu'ils couvraient de legitime — « Sa devise :
// "…" » — est desormais pris par citation_en_soi(), qui juge la portion
// citee et non ce qui la precede.
//
// Le prix assume : une citation COURTE introduite par un seul
// deux-points n'est plus vue. On ne peut pas avoir les deux, le meme
// signe servant aux deux usages.
const VERBE_PROCHE = '/\b(?:' . VERBES . ')\b[^.]{0,40}$/iu';

// LE NOM DE LA REVUE, PLUTOT QUE LA FORME DU CHIFFRE.
//
// Neuf fois, un motif ecrit pour « une note de presse » a rate la meme
// affirmation dite autrement — « Score 96 », « Top 25 », « scores 93-95 »,
// « Score parfait », « awarded it scores between 92 and 95 », « rated it
// between 91 and 94 », « a 96-point score », « على 97 في CA », et
// « la recompense CA 2011 » en francais.
//
// Courir apres les formes ne marche pas : il y en a toujours une de
// plus. Une fiche, en revanche, n'a aucune raison de NOMMER Cigar
// Aficionado sinon pour s'en prevaloir. C'est le marqueur robuste, et il
// vaut pour les six langues d'un coup.
//
// FAUX POSITIF ASSUME : en chinois, 雪茄爱好者 est a la fois le nom de la
// revue et le mot courant pour « amateur de cigares ». La fiche Quintero
// l'emploie au second sens — d'ou l'exception nommee plus bas.
const REVUES_CITEES = '/Cigar\s*Aficionado|Cigar\s*Journal|Cigar\s*Insider|Cigar\s*Snob'
                    . '|سيجار أفيسيونادو|雪茄爱好者|\bin CA\b|\ben CA\b|\bفي CA\b'
                    . '|\bCA\b\s*[,.:]?\s*\d{2,3}|r[ée]compense\s+CA\b/u';

// LES RANGS MONDIAUX, DANS LES SIX LANGUES.
//
// Les migrations R1, R4 et R5 les ont retires du FRANCAIS : personne ne
// publie de classement mondial des ventes de cigares, ni de palmares des
// degustateurs. Le controle, lui, ne lisait que le francais.
//
// L'anglais en portait sept, dans les 43 fiches ou `history` est un
// autre texte que le francais : « the world's best-selling cigar »,
// « the world's most prestigious », « the most important independent
// tobacco family in the world », « the most experienced tasters in the
// world », « the most complex cigar ever commercially released ».
//
// « many experts consider » n'est pas une source : c'est une facon de ne
// pas en donner. Le motif le prend.
const RANGS_MONDIAUX = '/\bworld\x27s\s+(?:best|finest|most|leading|top)\b'
                     . '|\bthe\s+(?:best|finest|greatest|most\s+\w+)\b[^.]{0,50}\b(?:in the world|ever|of all time|anywhere)\b'
                     . '|\bmany experts consider\b'
                     . '|\b(?:le|la|les)\s+plus\s+\w+[^.]{0,45}?\b(?:au|du)\s+monde\b'
                     . '|\b(?:le|la)\s+plus\s+\w+\s+jamais\b|\bpremier\s+\w+\s+mondial\b'
                     . '|\bel\s+m[áa]s\s+\w+\s+del\s+mundo\b|\bder\s+\w+ste\s+der\s+Welt\b'
                     . '|世界上最|الأكثر\s+\S+\s+في\s+العالم/iu';

// LA CONSOMMATION DE TABAC ATTRIBUEE A QUELQU'UN DE NOMME.
//
// L'inventaire initial en comptait quatre, sur des personnes VIVANTES.
// L'anglais d'Avo en gardait une : « having smoked his own cigars daily
// throughout his final years ».
//
// Le motif vise la forme affirmative. Une NEGATION est legitime — la
// fiche Hemingway dit « a format that Hemingway never actually smoked »,
// ce qui corrige une croyance au lieu d'en creer une.
const CONSOMMATION_PRETEE = '/\bhaving smoked\b|\bsmoked\s+(?:his|her|their)\s+own\b'
                          . '|\bwas never seen without\b|\ba devoted smoker\b'
                          . '|\bfumait\s+(?:quotidiennement|chaque jour|tous les jours)\b/iu';

// Le seul rang mondial admis, et pourquoi.
const RANGS_ADMIS = [
    'Guantanamera|history' =>
        'porte sur la chanson dont la marque tire son nom, et reste au conditionnel',
];

// Les emplois LEGITIMES d'un nom de revue, declares un par un.
const REVUES_ADMISES = [
    'Quintero|celebrities|zh' =>
        '雪茄爱好者 y designe des amateurs de cigares, pas la revue homonyme',
];

/**
 * Une parole est-elle pretee dans ce texte ? Rend l'extrait, ou ''.
 *
 * Y compris quand le texte AVOUE inventer. Joya de Nicaragua portait
 * une phrase de Nixon suivie de « citation apocryphe mais
 * vraisemblable » : l'auteur savait, l'a ecrit, et l'a publiee quand
 * meme. Savoir qu'on invente et le dire ne rend pas la citation
 * moins publiee — cela documente seulement qu'elle est fausse.
 */
/**
 * Une portion entre guillemets est-elle une citation PAR ELLE-MEME,
 * sans qu'aucun verbe ne l'introduise ?
 *
 * La Flor Dominicana posait deux phrases entieres entre apostrophes,
 * apres un point, sans verbe : « Si tu sais ce que tu fumes, tu
 * n'evalues plus le cigare. Tu evalues tes attentes. » L'attribution
 * etait faite par l'EN-TETE de la fiche — « Jose Blanco », en gras
 * au-dessus — et une expression reguliere ne lit pas la mise en page.
 *
 * Le detecteur cherchait la syntaxe de l'attribution ; il suffisait de
 * ne pas l'ecrire pour lui echapper. Ici on ne cherche plus de verbe :
 * une portion longue, ou qui contient une phrase complete, est une
 * parole. Les guillemets d'ironie entourent un TERME — « zone doree »,
 * « petit cigare » — donc courts et sans point final interne.
 */
function citation_en_soi(string $extrait): bool {
    $dedans = mb_substr($extrait, 1, -1);
    return mb_strlen($extrait) >= 40 || preg_match('/[.!?]\s*\S/u', $dedans);
}

function parole_pretee(string $t): string {
    // L'aveu vaut constat : apocryphe, attribuee a tort, pretee.
    if (preg_match('/\bapocryphe|attribu\w+\s+[àa]\s+tort|pr[ée]tendument/iu', $t, $aveu)) {
        return $aveu[0];
    }
    // 1. Les guillemets francais, s'ils suivent un verbe de parole ou
    //    un deux-points. Sans cette condition, « le roi du monde » —
    //    une traduction de nom de marque — serait pris pour une citation.
    if (preg_match_all('/[«][^»]{12,}[»]/u', $t, $m, PREG_OFFSET_CAPTURE)) {
        foreach ($m[0] as [$extrait, $pos]) {
            if (citation_en_soi($extrait)) return $extrait;
            if (preg_match(VERBE_PROCHE, mb_strcut($t, 0, $pos))) return $extrait;
        }
    }
    // 2. OUVRIR et FERMER ne se reconnaissent pas au meme signe.
    //    Une apostrophe ouvrante n'est pas PRECEDEE d'une lettre ('il
    //    avait) ; une fermante n'est pas SUIVIE d'une lettre
    //    (survivrait'.). La premiere version testait la meme condition
    //    des deux cotes et ratait toutes les citations — car leur
    //    apostrophe fermante suit toujours une lettre.
    preg_match_all('/(?<![\p{L}])\x27/u', $t, $mo, PREG_OFFSET_CAPTURE);
    preg_match_all('/\x27(?![\p{L}])/u',  $t, $mf, PREG_OFFSET_CAPTURE);
    $ouvre = array_column($mo[0] ?? [], 1);
    $ferme = array_column($mf[0] ?? [], 1);
    if (!$ouvre || !$ferme) return '';
    foreach ($ouvre as $a) {
        $b = null;
        foreach ($ferme as $p) if ($p > $a) { $b = $p; break; }
        if ($b === null || $b - $a < 12) continue;
        $avant = mb_strcut($t, 0, $a);
        $apres = mb_strcut($t, $b + 1, 40);
        $extrait = mb_strcut($t, $a, $b - $a + 1);
        $suivi = preg_match('/^\s*[,.]?\s*(?:aurait|avait|a)?[- ]?(?:t[- ])?(?:il|elle|on)?[- ]?\s*(?:' . VERBES . ')/iu', $apres);
        if (citation_en_soi($extrait) || preg_match(VERBE_PROCHE, $avant) || $suivi) {
            return mb_substr($extrait, 0, 60);
        }
    }
    return '';
}
// Ce que le projet assume comme citation VÉRIFIABLE : une œuvre publiée
// que le lecteur peut aller lire. La liste est explicite — une exception
// implicite est une porte ouverte.
const CITATIONS_SOURCEES = [
    'Rudyard Kipling' => 'vers de « The Betrothed » (1885), publié et vérifiable',
];

// Une fiche peut RAPPORTER une vantardise sans la reprendre à son
// compte. El Rey del Mundo raconte que sa maison faisait imprimer sur
// ses boîtes qu'elle produisait « le meilleur cigare de la terre » — et
// qualifie elle-même la formule de réclame immodeste. Le motif ne peut
// pas distinguer les deux ; l'exception est donc nommée, et réaffichée
// à chaque passage vert. Une exception qu'on ne voit plus redevient un
// trou.
const AFFIRMATIONS_HISTORIQUES = [
    'El Rey del Mundo|celebrities|0' =>
        'rapporte un slogan de 1848 en le désignant comme réclame, sans le reprendre à son compte',
];

// Les trois champs narratifs et la clé où ils rangent leur texte. Le
// motif de presse ne lisait QUE `gamme.story` : c'est ce qui a sauvé
// « le cigare de l'année n°1 » sur My Father, écrit dans une anecdote.
// Un contrôle rate aussi ce qu'il ne regarde pas.
const CHAMPS_NARRATIFS = ['gamme' => 'story', 'celebrities' => 'anecdote', 'pairings' => 'notes'];

// ════════════════════════════════════════════════════════
// --autotest : les cas que parole_pretee() a deja rates
// ────────────────────────────────────────────────────────
// Cette fonction a echoue CINQ fois au cours du chantier, chaque fois
// sur une tournure a laquelle elle n'avait pas ete pensee. Un passage
// vert sur le corpus du jour ne prouve rien : il dit qu'il n'y a pas de
// defaut AUJOURD'HUI, pas que le detecteur marche encore.
//
// Chaque ligne DOIT ci-dessous est un cas qui est deja passe au travers.
// ════════════════════════════════════════════════════════
if ($autotest) {
    $cas = [
        // ── DOIT detecter ───────────────────────────────
        [true,  "Churchill confia un jour : « je ne fume que pour la fumée bleue »."],
        [true,  "Sa devise : « le tabac ne ment jamais à qui sait attendre »."],
        // Verbe APRES la citation — rate a la 2e version (Bolívar).
        [true,  "'Ce cigare n'a pas d'égal dans toute l'île', déclara-t-il."],
        // Verbe absent de la liste — Santa Damiana, « répète-t-il ».
        [true,  "'Un cigare doux est le plus dur à faire', répète-t-il depuis trente ans."],
        // Verbe absent de la liste — Partagás USA, « en soulignant que ».
        [true,  "Il reconnut le travail dominicain en soulignant que 'le terroir ne se transplante pas'."],
        // AUCUN verbe : l'en-tete de la fiche attribuait — La Flor Dominicana.
        [true,  "Blanco travaille à l'aveugle. 'Si tu sais ce que tu fumes, tu n'évalues plus le cigare.'"],
        // L'aveu vaut constat — Joya de Nicaragua.
        [true,  "« Le seul cigare que je puisse fumer » — citation apocryphe mais vraisemblable."],

        // ── NE DOIT PAS detecter ────────────────────────
        // L'apostrophe francaise est une elision : 4 fausses alertes a la 3e version.
        [false, "L'homme d'Estelí n'a jamais rien cédé sur la qualité de l'assemblage qu'il signe."],
        // Guillemets d'ironie autour d'un TERME, precedes d'un deux-points — Oliva.
        [false, "L'idée : la 'zone dorée' d'un cigare est son tiers central."],
        // Idem, avec un superlatif autour — Trinidad.
        [false, "Le Reyes est souvent considéré comme le meilleur 'petit cigare' cubain."],
        // Traduction d'un nom de marque, sans verbe — El Rey del Mundo.
        [false, "Antonio Allones baptise sa maison « le roi du monde » en 1848."],
        // Un nom de vitole entre guillemets, court et sans phrase.
        [false, "Le format « Eye of the Shark » est un figurado."],
    ];
    $rates = 0;
    foreach ($cas as $i => [$attendu, $texte]) {
        $obtenu = parole_pretee($texte) !== '';
        if ($obtenu !== $attendu) {
            $rates++;
            printf("  RATE #%d — attendu %s, obtenu %s\n    %s\n",
                   $i, $attendu ? 'detecte' : 'ignore', $obtenu ? 'detecte' : 'ignore',
                   mb_substr($texte, 0, 78));
        }
    }
    if ($rates) {
        printf("\n%d cas sur %d echouent.\n", $rates, count($cas));
        exit(1);
    }
    printf("parole_pretee : %d cas construits, tous conformes.\n", count($cas));
    exit(0);
}

$colonnesBrands = [];
foreach ($db->query('DESCRIBE `brands`') as $c) $colonnesBrands[$c['Field']] = true;
$gammeTrad = array_values(array_filter(
    array_map(fn($l) => "gamme_$l", ['en','es','de','zh','ar']),
    fn($c) => isset($colonnesBrands[$c])));
$selTrad = $gammeTrad ? ', `' . implode('`, `', $gammeTrad) . '`' : '';

foreach ($db->query("SELECT name, scores, celebrities, gamme, pairings, history$selTrad FROM brands ORDER BY name") as $r) {
    $marques++;

    // ── Notes chiffrées : source consultable exigée ──────
    //
    // LE TROU LE PLUS GRAVE DU CHANTIER. Ce contrôle ne lisait que la
    // COLONNE `scores` — vidée par la migration 058. Il annonçait donc
    // « 0 note chiffrée, toutes accompagnées d'une source consultable ».
    // Littéralement vrai, et complètement faux : QUARANTE notes vivaient
    // dans le sous-tableau `gamme[].scores`, avec revue, note et année,
    // et panels.js les affichait sur chaque fiche.
    //
    // Vider un conteneur et vérifier CE conteneur ne prouve rien sur la
    // donnée : elle avait simplement une seconde adresse. On collecte
    // donc les deux, et toute nouvelle adresse doit être ajoutée ici.
    $recolte = [];
    foreach (json_decode((string)$r['scores'], true) ?: [] as $s) {
        $recolte[] = ['ou' => 'colonne scores', 's' => $s];
    }
    foreach (json_decode((string)$r['gamme'], true) ?: [] as $g) {
        foreach ($g['scores'] ?? [] as $s) {
            $recolte[] = ['ou' => 'gamme « ' . ($g['name'] ?? '?') . ' »', 's' => $s];
        }
    }

    foreach ($recolte as ['ou' => $ou, 's' => $s]) {
        $notes++;
        $ref = trim((string)($s['source_url'] ?? ''));
        if ($ref === '') {
            $defauts[] = sprintf(
                '%s : %s porte la note « %s %s (%s) » sans source_url — invérifiable',
                $r['name'], $ou, $s['source'] ?? '?', $s['score'] ?? '?', $s['year'] ?? '?');
        } elseif (!preg_match('#^https?://#i', $ref)) {
            $defauts[] = sprintf('%s : source_url « %s » n\'est pas une adresse',
                                 $r['name'], mb_substr($ref, 0, 40));
        }
    }

    // Le francais portait 40 notes, les cinq autres langues 38 : Arturo
    // Fuente et Cohiba en avaient une de plus en francais seulement. Un
    // controle de parite sur le NOMBRE d'entrees ne le voyait pas — il
    // compte les vitoles, pas leurs sous-tableaux.
    $nFr = 0;
    foreach (json_decode((string)$r['gamme'], true) ?: [] as $g) $nFr += count($g['scores'] ?? []);
    foreach (['en','es','de','zh','ar'] as $l) {
        if (!isset($colonnesBrands['gamme_' . $l])) continue;
        $nL = 0;
        foreach (json_decode((string)$r['gamme_' . $l], true) ?: [] as $g) $nL += count($g['scores'] ?? []);
        if ($nL !== $nFr) {
            $defauts[] = sprintf('%s : %d note(s) dans gamme[].scores en français, %d en %s',
                                 $r['name'], $nFr, $nL, $l);
        }
    }

    // ── Notes de presse cachées dans les récits de vitoles ──
    //
    // La migration 058 a vidé la colonne `scores`. Mais douze récits de
    // gamme portaient la même affirmation EN TEXTE : « Score 96 »,
    // « Cigar de l'Année n°1 Cigar Aficionado 2011 ». Vider la colonne
    // sans regarder la prose aurait laissé le défaut là où on ne le
    // cherchait pas — exactement le motif de la migration 031, où un
    // superlatif retiré d'un champ survivait dans un autre.
    // « Score Cigar Aficionado 93 » a survecu a la premiere version :
    // elle exigeait le nombre JUSTE APRES « score ». Le nom de la revue
    // peut s'intercaler, et il le fait.
    // « classe parmi les 25 meilleurs cigares de l'annee » : un
    // classement de presse sans le mot « score ». Puis le pluriel
    // « scores 93-95 », puis « Score parfait 100/100 » sur trois
    // chiffres, puis « le meilleur PETIT cigare cubain » ou l'adjectif
    // s'intercale. Sixieme forme, sixieme elargissement.
    $presse = '/\bscores?\b[^.]{0,30}?\b\d{2,3}\b|\b\d{2,3}\b[^.]{0,20}?\bscores?\b'
            . '|\b9\d\s*points?\b'
            // UNE NOTE DE PRESSE SANS CHIFFRE. Cohiba annonçait « Score
            // parfait par plusieurs experts » — dans les six langues,
            // français compris. Le motif exigeait un NOMBRE près du mot
            // « score » ; « parfait » dit exactement « 100/100 » sans
            // l'écrire. Huitième forme de la même affirmation.
            . '|\bscores?\s+parfaits?\b|\bnotes?\s+parfaites?\b'
            . '|Cigare?\s+de\s+l.Ann[ée]e|Cigar\s+of\s+the\s+Year'
            . '|class\w+\s+parmi|\btop\s*\d{1,3}\b|\btops?\s+annuels?\b'
            . '|le\s+plus\s+r[ée]compens'
            // « MEILLEUR CIGARE » : il faut la PORTEE, pas les deux mots.
            //
            // Elargi sans garde-fou a la migration 071 pour attraper « le
            // meilleur PETIT cigare cubain », le motif s'est mis a lever
            // trois recits ordinaires des le balayage de `history` :
            //   « le meilleur cigare serait celui qu'il roulerait
            //     lui-meme »            — une conviction de 1912
            //   « les wrappers de LEURS meilleurs cigares »
            //                           — un possessif, pas un classement
            //   « produisaient DE meilleurs cigares »
            //                           — un comparatif, pas un superlatif
            //
            // Ce qui fait le classement n'est pas « meilleur » : c'est
            // le CHAMP sur lequel il porte — du monde, de l'annee, de la
            // maison, cubain. Sans complement, « meilleur cigare » est
            // une phrase francaise ordinaire.
            . '|\bmeilleurs?\b[^.]{0,25}?\bcigares?\b\s*(?:du\s+monde|au\s+monde'
            . '|de\s+l.ann[ée]e|de\s+tous\s+les\s+temps|de\s+la\s+maison|de\s+la\s+marque'
            . '|cubains?|dominicains?|nicaraguayens?|honduriens?|jamais)'
            . '|\d{1,3}\s+meilleurs?\b|\bmeilleurs?\s+cigares?\s+de\s+l.ann[ée]e/iu';

    // `history` est du texte simple, pas un tableau JSON — d'ou la
    // normalisation. Il etait absent du balayage, et portait ONZE
    // affirmations de presse : « score de 96 », « cigare de l'annee »,
    // « Top 25 », « tops annuels »... Toutes ecrites dans des formes que
    // le motif connaissait deja depuis la migration 064.
    //
    // Deuxieme fois que ce controle rate par l'endroit et non par la
    // formule, apres My Father a la migration 068. La lecon ne se retient
    // visiblement pas toute seule : quand on ajoute un motif, il faut
    // aussi se demander OU on le passe.
    $narratifs = CHAMPS_NARRATIFS;
    $narratifs['history'] = null;

    foreach ($narratifs as $champ => $cle) {
        $entrees = $cle === null
            ? [['name' => 'récit', 'history' => (string)$r[$champ]]]
            : (json_decode((string)$r[$champ], true) ?: []);
        if ($cle === null) $cle = 'history';
        foreach ($entrees as $i => $e) {
            $s = (string)($e[$cle] ?? '');
            if ($champ === 'celebrities') $anecdotes++;
            if ($s === '') continue;
            $qui  = (string)($e['name'] ?? $e['type'] ?? '?');
            $exempt = isset(AFFIRMATIONS_HISTORIQUES["{$r['name']}|$champ|$i"]);

            if (!$exempt && preg_match(REVUES_CITEES, $s, $mr)) {
                $defauts[] = sprintf('%s : %s « %s » cite une revue — « %s »',
                                     $r['name'], $champ, $qui, trim($mr[0]));
            }
            if (!$exempt && preg_match($presse, $s, $m)) {
                $defauts[] = sprintf('%s : %s « %s » porte une note de presse — « %s »',
                                     $r['name'], $champ, $qui, trim($m[0]));
            }

            // ── Paroles prêtées ─────────────────────────
            $extrait = parole_pretee($s);
            if ($extrait === '' || isset(CITATIONS_SOURCEES[$qui])) continue;
            $defauts[] = sprintf('%s : %s « %s » prête une parole — « %s… »',
                                 $r['name'], $champ, $qui, mb_substr(trim($extrait), 0, 42));
        }
    }
}

// ════════════════════════════════════════════════════════
// Les CINQ AUTRES LANGUES affirment-elles ce que le français a retiré ?
// ────────────────────────────────────────────────────────
// Depuis la migration 058, chaque note de presse a été retirée du
// FRANÇAIS, et ce contrôle ne lisait que le français — « c'est la
// colonne source, les autres en dérivent ».
//
// Elles n'en dérivent que si on les retraduit. Cent six affirmations
// vivaient encore dans les colonnes espagnole, allemande, chinoise,
// anglaise et arabe : « #1 Cigar of the Year », « logró un 96 »,
// « eine 96 im Cigar Aficionado », « 96分获得雪茄爱好者年度第一 ».
// Le français était vert, et le lecteur allemand lisait la note.
//
// Un contrôle qui ne lit qu'une langue sur six ne protège qu'un
// sixième du site.
// ════════════════════════════════════════════════════════

const PRESSE_LANGUES = [
 'en' => '/\bscored?\s+(?:a\s+|of\s+)?\d{2,3}\b|\b\d{2,3}\s*points?\b|Cigar of the Year'
       . '|\bTop\s*\d+|perfect scores?|most awarded|highest (?:score|rating|ranking)/i',
 'es' => '/\bpuntuaci\w+|\b\d{2,3}\s*puntos?\b|Cigarro del A\w+o|Puro del A\w+o|\bTop\s*\d+'
       . '|\blogr\w+\s+un\s+\d{2,3}\b|\bobtuvo\s+(?:un\s+)?\d{2,3}\b/iu',
 'de' => '/\bBewertung\w*|\b\d{2,3}\s*Punkte?\b|Zigarre des Jahres|\bTop\s*\d+'
       . '|\berzielte\s+(?:er\s+)?(?:mit[^.]{0,40})?\s*eine\s+\d{2,3}\b/iu',
 'zh' => '/\d{2,3}\s*分(?!钟)|年度雪茄|年度第一|次第一|前\s*\d+\s*名?|最高评分|满分/u',
 'ar' => '/\b\d{2,3}\s*(?:نقطة|نقاط|درجة)|\d{2,3}\s*\/\s*100/u',
];

// L'arabe n'a pas de frontière de mot exploitable par PCRE : « سيجار
// العام » (« cigare de l'année ») chevauche deux mots de « مصانع
// السيجار العاملة » (« les fabriques de cigares en activité »). Le
// motif arabe renonce donc à cette formule et s'en tient aux chiffres.
foreach (['history', 'gamme', 'celebrities', 'pairings'] as $champ) {
    foreach (array_keys(PRESSE_LANGUES) as $l) {
        if (!isset($colonnesBrands["{$champ}_$l"])) continue 2;
    }
    $cols = implode(', ', array_map(fn($l) => "`{$champ}_$l`", array_keys(PRESSE_LANGUES)));
    foreach ($db->query("SELECT name, $cols FROM brands ORDER BY name") as $r) {
        foreach (PRESSE_LANGUES as $l => $motif) {
            $brut = (string)$r["{$champ}_$l"];
            if ($brut === '' || $brut === '[]') continue;
            // Ne lire que le TEXTE : la clé JSON `"scores"` faisait passer
            // chaque fiche pour porteuse d'une note. Piège rencontré trois
            // fois dans ce chantier, avec `wrapper` puis `scores`.
            $x = ltrim($brut);
            if ($x !== '' && ($x[0] === '[' || $x[0] === '{')) {
                $j = json_decode($brut, true);
                if (!is_array($j)) continue;
                $feuilles = [];
                array_walk_recursive($j, function ($v) use (&$feuilles) {
                    if (is_string($v)) $feuilles[] = $v;
                });
                $t = implode("\n", $feuilles);
            } else {
                $t = $brut;
            }
            if (preg_match($motif, $t, $m)) {
                $defauts[] = sprintf('%s : %s_%s porte une note de presse — « %s »',
                                     $r['name'], $champ, $l, trim($m[0]));
            }
            // Le nom de la revue, quelle que soit la forme du chiffre.
            if (preg_match(REVUES_CITEES, $t, $m)
                && !isset(REVUES_ADMISES["{$r['name']}|$champ|$l"])) {
                $defauts[] = sprintf('%s : %s_%s cite une revue — « %s »',
                                     $r['name'], $champ, $l, trim($m[0]));
            }
            if (preg_match(RANGS_MONDIAUX, $t, $m)
                && !isset(RANGS_ADMIS["{$r['name']}|$champ"])) {
                $defauts[] = sprintf('%s : %s_%s porte un rang mondial — « %s »',
                                     $r['name'], $champ, $l, trim($m[0]));
            }
            if (preg_match(CONSOMMATION_PRETEE, $t, $m)) {
                $defauts[] = sprintf('%s : %s_%s prete une consommation de tabac — « %s »',
                                     $r['name'], $champ, $l, trim($m[0]));
            }
        }
    }
}

// ── Les six colonnes doivent rester parallèles ──────────
//
// `celebrities` est un tableau, et les cinq traductions en sont la copie
// entrée par entrée. Retirer une entrée du français sans la retirer des
// traductions décale tout le reste : le lecteur anglais lirait
// l'anecdote de Churchill sous le nom de Groucho Marx.
//
// C'est arrivé avant ce contrôle : Drew Estate et Macanudo portaient
// deux anecdotes en français et une seule dans les cinq autres langues.
//
// Les champs testés sont ceux qui EXISTENT en base, pas une liste
// recopiée : `scores` n'est pas traduit et n'a donc pas de colonnes de
// langue. Supposer le contraire faisait tomber l'outil entier sur une
// colonne inconnue — un contrôle qui plante ne contrôle rien.
$colonnes = [];
foreach ($db->query('DESCRIBE `brands`') as $c) $colonnes[$c['Field']] = true;

foreach (['celebrities', 'gamme', 'pairings'] as $champ) {
    if (!isset($colonnes[$champ . '_en'])) continue;
    $cols = implode(', ', array_map(fn($l) => "`{$champ}_$l`", ['en','es','de','zh','ar']));
    foreach ($db->query("SELECT name, `$champ`, $cols FROM brands
                          WHERE `$champ` IS NOT NULL AND `$champ` <> '[]'") as $r) {
        $fr = json_decode((string)$r[$champ], true);
        if (!is_array($fr)) continue;
        foreach (['en','es','de','zh','ar'] as $l) {
            $t = json_decode((string)$r[$champ . '_' . $l], true);
            if ($t === null) continue;               // pas encore traduit : c'est le travail de i18n_fraicheur
            if (count($t) !== count($fr)) {
                $defauts[] = sprintf('%s : %s porte %d entrée(s) en français et %d en %s',
                                     $r['name'], $champ, count($fr), count($t), $l);
            }
        }
    }
}

// ── Rapport ─────────────────────────────────────────────

echo "CigarOdyssey — ce que les fiches de marques affirment\n\n";

if (!$defauts) {
    printf("  %d marques verifiees.\n", $marques);
    // Ce message a menti pendant tout le chantier : il disait « 0 note,
    // toutes sourcees » alors que quarante notes vivaient dans
    // `gamme[].scores`. Il nomme desormais les endroits regardes — un
    // compte vert ne vaut que par le perimetre qu'il annonce.
    printf("  %d note(s) chiffree(s) dans `scores` ET dans `gamme[].scores`,\n", $notes);
    echo   "    toutes accompagnees d'une source consultable, et a parite dans les six langues.\n";
    printf("  %d anecdote(s), aucune parole pretee sans source.\n", $anecdotes);
    echo "  Les six colonnes de chaque tableau portent le meme nombre d'entrees.\n";
    echo "  Les quatre champs narratifs sont balayes : gamme, celebrities, pairings, history.\n";
    echo "  Les SIX langues sont balayees, pas seulement le francais.\n";
    foreach (CITATIONS_SOURCEES as $qui => $pourquoi) {
        echo "  Citation assumee — $qui : $pourquoi\n";
    }
    foreach (AFFIRMATIONS_HISTORIQUES as $ou => $pourquoi) {
        echo "  Exception nommee — $ou : $pourquoi\n";
    }
    exit(0);
}

foreach ($defauts as $d) echo "  ECHEC  $d\n";
printf("\n%d affirmation(s) non sourcable(s). Voir docs/relecture.md.\n", count($defauts));
exit(1);
