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
