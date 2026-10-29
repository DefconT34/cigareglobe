## Migration 289 — Chester corrigé, Soho retiré

Vérification par `expert-cigare` (≈31 000 jetons ; page de C.Gars en 403, lue par résumés de recherche). Chester : la Casa del Habano est au 32 Watergate Street, le 34 est la boutique Turmeaus voisine (même exploitant) ; « célèbre » retiré dans les six langues, sceaux remis en « machine » (le français a changé). Soho (283) : aucune boutique à Old Compton Street ni chez Selfridges, fiche retirée. Knutsford : pas de fiche, la Casa de C.Gars n'est pas confirmée. Cliquet 9 517 (cinq sceaux de Chester redevenus machine). Tests 1039 / 0.

## Mention sanitaire persistante sur l'accueil

Sur l'accueil du globe, la mention n'existait que dans le portail d'âge : une fois la réponse donnée, elle disparaissait (les pages marque et pays, le forum et les mentions légales l'avaient déjà). `#sante-bandeau` : une ligne fixée en bas, montrée seulement sous `.age-ok`, traduite par `data-i18n="age_sante"` (six langues, clé existante), au-dessus de la barre mobile (`body.mobile-mode`). Vérifiée en local : bureau, mobile 375 px, en/ar/zh. Tests 1039 / 0. Pas de migration : `git pull` suffit.

## Migration 288 — Zira Hotel retiré

La fiche 935 restait « à vérifier » depuis la 281 : page officielle en 403, aucun cigar bar décrit. Nouvelle pièce : l'hôtel écrit lui-même, en réponse à un avis TripAdvisor, qu'il est non-fumeur et que sa seule zone fumeurs est la terrasse du restaurant ; Booking et Agoda ne décrivent qu'un bar / lounge. Retirée (`is_verified = 0`), comme la fiche 950. À rétablir si l'hôtel confirme un cigar bar. Tests 1039 / 0.

## Migration 287 — relecture des données générales des pays

Les 184 lounges restés « machine » sont exactement les fiches dépubliées : l'exporteur les écarte à dessein, rien à relire. Les `producer_geo` (devise, langue, indépendance) n'étaient pas dans le plan de l'exporteur ; je ne l'ai pas étendu (une dizaine d'outils s'y appuient) et j'ai écrit la migration à la main, avec l'empreinte du français dans le WHERE. 80 textes × 5 langues relus par expert-traduction (≈27 000 jetons), 1 corrigé : « Part of the Kingdom of the Netherlands since 1986 ». Piège : ma première version dépassait le `varchar(50)` et MySQL l'a coupée sans erreur ; le test « aucune valeur pile à 50 » l'a vu. Cliquet : 9 522 relues. Tests 1039 / 0.

## Migration 286 — relecture de l'espagnol, tout le reste

1 808 textes espagnols relus par `expert-traduction`, 36 morceaux : 233 corrigés, 1 575 validés, 0 refus (surtout *cigarro* → *puro*, *vitola* pour bague → *anilla*, *torcer* → *liar*, accords). Quelques agents avaient rendu `texto`/`motivo` au lieu de `texte`/`motif` : clés normalisées avant la fusion. « 1500 » du lounge 146 repris en « 1 500+ » comme le français ; trois noms de gammes (Arturo Fuente, Davidoff, Holt's) figés dans la référence de langue. 1039 réussites / 0 échec ; cliquet à 9 122 relues. Coût : 36 agents, ≈2,6 M de jetons. **La relecture des traductions est terminée.**

## Migration 285 — relecture de l'allemand, tout le reste

1 808 textes allemands (pays, marchés, zones, arômes, lexique, feuilles, établissements, marques) relus par `expert-traduction`, 36 morceaux : 169 corrigés, 1 639 validés, 0 refus de l'importeur. Trois accrocs aux garde-fous, réglés à la main : l'année « 1500 » du lounge 146 (le français écrit « 1 500+ » ; repris tel quel), le slogan « Luxury without the pretense » (Cohiba USA) remis en allemand comme le reste de la colonne, et « am besten » chez PDR Cigars, fidèle au « le mieux » du français et figé au cliquet des superlatifs. 1039 réussites / 0 échec ; cliquet à 7 314 relues. Coût : 36 agents, ≈2,7 M de jetons.


## Migrations 282 à 284 — relecture du reste, chinois, arabe et anglais

Dernier reliquat des entités (pays, marchés, zones, arômes, lexique, feuilles, établissements, marques) relu par `expert-traduction`, un agent par morceau de 28 000 caractères : zh 6 textes (4 corrigés, 282), ar 10 (7 corrigés, 283), en 1 269 (88 corrigés, 284 : « cepo » → *ring gauge*, *plant* → *factory*, *softness* → *mildness*, *caviste* ≠ *tobacconist*, superlatifs absents du français retirés). Un seul refus, zh « 最低消费 » (contient le caractère interdit) : reformulé « 消费不低于 30 欧元 ». Garde-fous verts, 1039 réussites / 0 échec ; cliquet à 5 506 relues. Coût : 36 agents, ≈2,2 M de jetons.


## Migration 281 — trois domaines morts : lefagot.com, zirahotel.com, espinashotel.com

`sources.php --verifier` a vu trois domaines résolus en septembre devenir inexistants. expert-cigare a relu les trois fiches (recherches en langue locale et en anglais), puis un contradicteur a lu les pages de chaque salon de l'Espinas Palace. Fagot Cigare (#11, Abidjan) et Zira Hotel (#935, Belgrade) restent « à vérifier », leur description ramenée à ce qui est sourcable ; l'Espinas Palace (#950, Téhéran) est retiré, l'hôtel publiant la liste de ses salons sans salon cigares (règle de la 155) ; son adresse était aussi fausse. La marque Le Fagot Cigar et les feuilles de Didiévi et de Tiébissou ne citent plus le domaine. Sceau des domaines refait (666). Cliquet des relues : 4 225 → 4 221, car la réécriture des descriptions de #11 et #935 remet leurs quatre traductions zh et ar au statut machine. Reste ouvert : lire la page officielle du Zira (403) ou appeler l'hôtel ; la sonde `lounges_sondes.json` notait encore lefagot.com « ok » en septembre.

## Migrations 279 et 280 — relecture des 859 textes `gamme`, `celebrities`, `pairings` et éditions limitées, chinois et arabe

Suite des 277-278 : 26 morceaux par langue relus par expert-traduction. zh : 358 corrigés, 501 validés ; ar : 447 corrigés, 412 validés ; 0 refus. Coût mesuré : 73 000 à 99 000 jetons par agent, environ 4,5 millions pour les 52 agents. Cliquet des relues : 2 507 → 4 225 (zh 1 821, ar 1 817). Trois noms de gammes en lettres latines (« The Man », Arturo Fuente et Holt's) entrent à la référence de `i18n_langue_check`. Non relu : le de, l'es, et le reste des fiches de marques. Alerte hors lot : `sources.php --verifier` voit désormais espinashotel.com, lefagot.com et zirahotel.com inexistants au DNS (6 fiches) ; le sceau n'a pas été refait, la règle « domaine mort ne se cite pas » reste à appliquer.

## Migrations 275 et 276 — relecture complète du chinois et de l'arabe, hors fiches de marques

Suite de l'essai de la 274. expert-traduction a relu 883 textes par langue (pays, marchés, zones, présence Habanos, arômes, lexique, géographie, feuilles, établissements), par morceaux de 28 000 caractères français ; les agents ne rendent que leurs corrections, `tools/i18n_relecture.php` écrit la migration et refuse tout texte qui enfreint les règles. **275 (zh)** : 879 relus, 303 corrigés. **276 (ar)** : 875 relus, 157 corrigés. Ce qui a été trouvé n'est pas que des superlatifs : des traductions tronquées ou à moitié restées en français (« 雪茄室 Kempinski Nile Garden City，配有俯瞰尼罗河 — »), des unités fausses (« 180 百万 »), Lübbecke confondu avec Lübeck, un contresens (« animal » pour 兽性), les noms de marques, d'hôtels et de sociétés remis en alphabet latin (convention choisie pour la relecture : les villes, pays et rues restent traduits). Douze textes restent au statut `machine` (4 en zh, 8 en ar) : la correction rendue contenait encore un superlatif, l'importeur l'a refusée. Coût : environ 410 000 jetons par langue. Cliquet des relues : 619 → 2 373. Non relu : les fiches de marques (926 textes par langue, 900 000 caractères de français : environ 3,7 millions de jetons par langue), le de et l'es. 1039 assertions, 0 échec.

## Migrations 277 et 278 — relecture de l'historique de 67 fiches de marques, chinois et arabe

Option B retenue : les 27 marques cubaines et les 40 autres marques les mieux dotées (célébrités, accords, éditions limitées), champ `history` seul. 67 textes par langue relus par expert-traduction : zh 38 corrigés, ar 49 corrigés (noms de marques et de personnes remis en alphabet latin, « cote » rendu par « مقاسات », « سيجارات » pour cigares, attribution à habanos.com dans Punch). Le contrôle des superlatifs a d'abord refusé 33 textes (19 zh, 14 ar) pour des sous-chaînes banales (« 最近 », « أكثر من ») ; reformulés puis 0 refus. Cliquet des relues : 2 507 (zh 962, ar 958). Les 314 autres fiches de marques, `gamme`/`celebrities`/`pairings`, le de et l'es restent en statut machine.
