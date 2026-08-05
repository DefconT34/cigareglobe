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

/** Cle primaire d'une table, telle que declaree par MySQL. */
function cle_primaire(PDO $db, string $table): ?string {
    static $cache = [];
    if (array_key_exists($table, $cache)) return $cache[$table];
    foreach ($db->query("DESCRIBE `$table`") as $c) {
        if ($c['Key'] === 'PRI') return $cache[$table] = $c['Field'];
    }
    return $cache[$table] = null;
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

    $pk = cle_primaire($db, $table);
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
        $q = $db->prepare("SELECT `$pk` k FROM `$table` WHERE `$champ` = ?");
        $q->execute([$src]);
        $h = empreinte_source($src);
        $n = 0;
        foreach ($q as $r) {
            // « machine » : une traduction fraichement importee n'a par
            // definition pas ete relue. Seul --relu le fait passer.
            $st->execute([$table, (string)$r['k'], $champ, $lang, $h, 'machine']);
            $n++;
        }
        return $n;
    } catch (Throwable $e) {
        $indisponible = true;
        fwrite(STDERR, "  fraicheur non suivie (migration 009 absente ?) : " . $e->getMessage() . "\n");
        return 0;
    }
}
