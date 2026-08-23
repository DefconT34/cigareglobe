<?php
// ════════════════════════════════════════════════════════
// tools/i18n_contenu_plan.php — Ce qui est traduisible, et comment
// ────────────────────────────────────────────────────────
// Partage par i18n_contenu.php (export / import) et i18n_dump.php
// (sauvegarde versionnable). Ces deux outils doivent voir exactement le
// meme perimetre : une divergence ferait sortir de la sauvegarde des
// colonnes pourtant traduites.
//
// Miroir de champs_traduits(), champs_libres() et
// champs_libres_scalaires() dans backend/data.php.
// ════════════════════════════════════════════════════════

if (!defined('LANGUES_CIBLES')) {
    define('LANGUES_CIBLES', ['en', 'es', 'de', 'zh', 'ar']);
}

/** Colonnes scalaires doublees par une colonne « champ_xx » (migration 007). */
function plan_contenu(): array {
    return [
        'producer_countries' => ['region','production','rev_detail','harvest','climate','soil','notes'],
        'markets'            => ['consumption','cigars','trend','note'],
        'production_zones'   => ['note'],
        'habanos_presence'   => ['status','ownership','description','festival'],
        'brands'             => ['history','gamme','celebrities','pairings'],
        'feuilles'           => ['emploi','genese','culture','caracteres','notes','pairings'],
        'aromes'             => ['texte'],
        'lounges'            => ['description'],
    ];
}

/** Colonnes JSON dont le contenu textuel passe par le dictionnaire (migration 008). */
function plan_libre(): array {
    return [
        'producer_countries' => ['brands'],
        'habanos_presence'   => ['factories', 'certifications', 'distributeurs'],
    ];
}

/** Colonnes scalaires traduites par le dictionnaire plutot que par cinq colonnes. */
function plan_libre_scalaire(): array {
    return ['habanos_presence' => ['founded', 'hq']];
}

/** Cles JSON dont la valeur est un nom propre : jamais traduites. */
function cles_non_traduites(): array {
    return ['name', 'city', 'founded', 'iconic', 'distributeur'];
}

/**
 * Cle primaire d'une table, telle que declaree par MySQL — TOUTES ses
 * colonnes.
 *
 * CE QUE LA VERSION PRECEDENTE RATAIT. Elle rendait la PREMIERE colonne
 * marquee PRI et s'arretait la. Sur une cle simple c'est exact ; sur une
 * cle composee c'est une identite tronquee, et deux lignes distinctes se
 * mettent a porter le meme identifiant.
 *
 * `aromes` l'a montre : cle (famille, contexte), et donc « cacao » en
 * NOTE et « cacao » en ACCORD confondus. Consequences en chaine —
 * translation_status ecrasait une empreinte par l'autre (quinze
 * traductions declarees perimees le jour meme de leur ecriture), et le
 * dump ecrivait « UPDATE aromes ... WHERE famille = 'cacao' », soit la
 * traduction de l'accord recopiee sur la note.
 *
 * Rien n'avertissait : le compteur d'import annoncait 100 lignes ecrites,
 * ce qui etait vrai. C'est l'etape d'apres qui melangeait.
 */
function cles_primaires(PDO $db, string $table): array {
    static $cache = [];
    if (isset($cache[$table])) return $cache[$table];
    $out = [];
    foreach ($db->query("DESCRIBE `$table`") as $c) {
        if ($c['Key'] === 'PRI') $out[] = $c['Field'];
    }
    return $cache[$table] = $out;
}

/**
 * Identifiant d'une ligne pour translation_status : les valeurs de la
 * cle primaire jointes par « | ». Sur une cle simple c'est la valeur
 * elle-meme, donc les empreintes deja posees restent valables.
 */
function identite_ligne(array $pk, array $ligne): string {
    $vals = [];
    foreach ($pk as $c) $vals[] = (string)$ligne[$c];
    return implode('|', $vals);
}

/** Colonnes d'une table. */
function colonnes_de(PDO $db, string $table): array {
    static $cache = [];
    if (isset($cache[$table])) return $cache[$table];
    $out = [];
    foreach ($db->query("DESCRIBE `$table`") as $c) $out[] = $c['Field'];
    return $cache[$table] = $out;
}

/**
 * Empreinte du texte source. Sert a savoir de QUEL francais une
 * traduction est la traduction — voir la migration 009. Le texte est
 * rogne : un espace de fin ne rend pas une traduction perimee.
 */
function empreinte_source(string $texte): string {
    return sha1(trim($texte));
}

/**
 * Retient de quel francais une traduction est issue.
 *
 * Appele a chaque ecriture par l'import : sans cela la table de
 * fraicheur serait perimee des le premier lot, et ne saurait plus rien
 * dire. Le texte source designe potentiellement plusieurs lignes — une
 * meme description peut servir a deux etablissements — on scelle donc
 * chacune.
 *
 * Silencieux si la migration 009 n'est pas appliquee : l'import doit
 * continuer de fonctionner sur une base qui ne connait pas cette table.
 */
function sceller(PDO $db, string $table, string $champ, string $lang, string $src): int {
    static $st = null, $indisponible = false;
    if ($indisponible) return 0;

    $pk = cles_primaires($db, $table);
    if (!$pk) return 0;

    try {
        if ($st === null) {
            $st = $db->prepare(
                'INSERT INTO translation_status
                     (entite, entite_id, champ, lang, source_hash, statut)
                 VALUES (?, ?, ?, ?, ?, ?)
                 ON DUPLICATE KEY UPDATE source_hash = VALUES(source_hash),
                                         statut      = VALUES(statut)'
            );
        }
        $q = $db->prepare('SELECT `' . implode('`, `', $pk) . "` FROM `$table` WHERE `$champ` = ?");
        $q->execute([$src]);
        $h = empreinte_source($src);
        $n = 0;
        foreach ($q as $r) {
            // « machine » : une traduction fraichement importee n'a par
            // definition pas ete relue. Seul --relu le fait passer.
            $st->execute([$table, identite_ligne($pk, $r), $champ, $lang, $h, 'machine']);
            $n++;
        }
        return $n;
    } catch (Throwable $e) {
        $indisponible = true;
        fwrite(STDERR, "  fraicheur non suivie (migration 009 absente ?) : " . $e->getMessage() . "\n");
        return 0;
    }
}
