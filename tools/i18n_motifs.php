<?php
// ════════════════════════════════════════════════════════
// tools/i18n_motifs.php — Traduction par motifs
// ────────────────────────────────────────────────────────
// Une partie du contenu de l'atlas suit des formes regulieres :
// « ~90M cigares/an », « $1.2B/an », « ~14M cigares premium/an ». Les
// traduire une par une serait long et source d'incoherences ; on decrit
// la forme une fois, et le chiffre est reporte tel quel.
//
//   php tools/i18n_motifs.php            apercu, rien n'est ecrit
//   php tools/i18n_motifs.php --ecrire   applique a la base
//
// Ce qui ne correspond a aucun motif est laisse intact : c'est de la
// prose, elle se traduit a la main (voir tools/i18n_contenu.php).
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }
require_once __DIR__ . '/../backend/config.php';

const LANGUES_M = ['en', 'es', 'de', 'zh', 'ar'];

/**
 * Motifs reconnus. Chaque entree : une expression reguliere sur la
 * valeur francaise, et le gabarit par langue ou {n} recoit le chiffre.
 */
function motifs(): array {
    return [
        // « ~90M cigares premium/an »
        [
            're' => '/^~?([\d.,]+)\s*M\s+cigares\s+premium\/an$/u',
            'tr' => [
                'en' => '~{n}M premium cigars/year',
                'es' => '~{n} M de puros premium/año',
                'de' => 'ca. {n} Mio. Premium-Zigarren/Jahr',
                'zh' => '每年约 {n} 百万支优质雪茄',
                'ar' => '~{n} مليون سيجار فاخر/سنة',
            ],
        ],
        // « ~350M cigares/an »
        [
            're' => '/^~?([\d.,]+)\s*M\s+cigares\/an$/u',
            'tr' => [
                'en' => '~{n}M cigars/year',
                'es' => '~{n} M de puros/año',
                'de' => 'ca. {n} Mio. Zigarren/Jahr',
                'zh' => '每年约 {n} 百万支雪茄',
                'ar' => '~{n} مليون سيجار/سنة',
            ],
        ],
        // « $1.2B/an »
        [
            're' => '/^\$([\d.,]+)\s*B\/an$/u',
            'tr' => [
                'en' => '${n}B/year',
                'es' => '{n} B$/año',
                'de' => '{n} Mrd. $/Jahr',
                'zh' => '每年 {n} 十亿美元',
                'ar' => '{n} مليار دولار/سنة',
            ],
        ],
        // « $380M/an »
        [
            're' => '/^\$([\d.,]+)\s*M\/an$/u',
            'tr' => [
                'en' => '${n}M/year',
                'es' => '{n} M$/año',
                'de' => '{n} Mio. $/Jahr',
                'zh' => '每年 {n} 百万美元',
                'ar' => '{n} مليون دولار/سنة',
            ],
        ],
        // « $500M » (sans periode)
        [
            're' => '/^\$([\d.,]+)\s*M$/u',
            'tr' => [
                'en' => '${n}M', 'es' => '{n} M$', 'de' => '{n} Mio. $',
                'zh' => '{n} 百万美元', 'ar' => '{n} مليون دولار',
            ],
        ],
    ];
}

/** Traductions d'une valeur, ou [] si aucun motif ne s'applique. */
function appliquer_motifs(string $valeur): array {
    foreach (motifs() as $m) {
        if (preg_match($m['re'], trim($valeur), $x)) {
            $out = [];
            foreach (LANGUES_M as $l) {
                if (isset($m['tr'][$l])) $out[$l] = str_replace('{n}', $x[1], $m['tr'][$l]);
            }
            return $out;
        }
    }
    return [];
}

// ── Parcours ──────────────────────────────────────────────
$plan = [
    'producer_countries' => ['production', 'revenue'],
    'markets'            => ['consumption', 'cigars'],
];

$db     = getDB();
$ecrire = in_array('--ecrire', $argv, true);
$vus = 0; $traites = 0; $lignes = 0;

foreach ($plan as $table => $champs) {
    $cols = [];
    foreach ($db->query("DESCRIBE `$table`") as $c) $cols[] = $c['Field'];

    foreach ($champs as $champ) {
        if (!in_array($champ . '_en', $cols, true)) {
            printf("%-22s %-14s (pas de colonnes de langue — ignore)\n", $table, $champ);
            continue;
        }
        $q = $db->query("SELECT DISTINCT `$champ` v FROM `$table`
                         WHERE `$champ` IS NOT NULL AND `$champ` <> ''");
        foreach ($q as $r) {
            $vus++;
            $tr = appliquer_motifs($r['v']);
            if (!$tr) { printf("   hors motif : %s\n", $r['v']); continue; }
            $traites++;
            if (!$ecrire) { printf("   %-32s -> %s\n", $r['v'], $tr['en']); continue; }
            foreach ($tr as $l => $txt) {
                $col = $champ . '_' . $l;
                $st = $db->prepare("UPDATE `$table` SET `$col` = ?
                                    WHERE `$champ` = ? AND (`$col` IS NULL OR `$col` = '')");
                $st->execute([$txt, $r['v']]);
                $lignes += $st->rowCount();
            }
        }
    }
}

printf("\n%d valeur(s) examinee(s), %d reconnue(s)%s\n", $vus, $traites,
       $ecrire ? sprintf(", %d ligne(s) mise(s) a jour", $lignes) : " (apercu — rien n'a ete ecrit)");
