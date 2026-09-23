# Septième recensement — les établissements

*16 septembre 2026. 508 fiches d'établissements — caves, lounges,
fumoirs d'hôtel, Casas del Habano —, 408 publiables, écrites entre le
1er août et le 5 septembre. Personne n'avait jamais sondé si elles
existent encore. Ce recensement est le premier mené avec l'équipe
d'agents : `expert-cigare` pour les relectures, avec un second
`expert-cigare` en contradicteur avant toute fermeture.*

---

## Méthode

Trois étages, du mécanique au lu.

1. **L'outil** — `tools/lounges_fraicheur.php`. Ce qu'on peut savoir
   d'une cave sans y aller : la classe de sa source (site officiel,
   annuaire de réseau, presse ; ou Google Maps, TripAdvisor, « fourni
   par l'établissement », « à vérifier », qui ne prouvent pas qu'un
   lieu est ouvert), l'année qu'elle porte, et si le site que la fiche
   cite répond encore (sonde HTTP figée dans `sql/lounges_sondes.json`
   ; un 403 ou un flux qui casse est « refuse », pas « mort » — on ne
   conclut que sur un nom qui ne résout plus, une connexion refusée, un
   404 ou un 410). Il en tire la liste des fiches **à relire**, et un
   cliquet dans la campagne de tests : ce nombre ne doit pas remonter.
2. **La relecture** — un `expert-cigare` par lot géographique cherche
   chaque fiche à relire en langue locale et en anglais, et rend un
   verdict sourcé : *confirmé* (source primaire ou presse ≤ 3 ans),
   *fermé* (une source dit la fermeture), *introuvable* (aucune trace
   après trois requêtes), *incertain* (l'hôtel existe, son espace
   cigares n'est décrit nulle part).
3. **La contradiction** — chaque *fermé* et chaque *introuvable* passe
   devant un second `expert-cigare` chargé de le réfuter avec une preuve
   datée. Une fermeture ne tient que si personne n'a pu la contredire ;
   un introuvable que personne ne retrouve devient *incertain*, jamais
   retiré sans source.

Et à part : **les réseaux**. 176 fiches tiennent d'un annuaire officiel
non daté (« PDF officiel Habanos S.A. », davidoff.com,
cohiba-atmosphere.com). Elles ne se relisent pas une à une : elles se
recoupent en bloc contre l'annuaire du réseau, par un agent par réseau.

## Ce que l'outil a dit avant toute lecture

| | |
|---|---|
| fiches publiables | 408 |
| source **sourcée** (site du lieu, hôtel, presse) | 189 |
| source **réseau** (annuaire officiel, non daté) | 176 |
| source **faible** (Google Maps, TripAdvisor, fourni par l'établissement) | 25 |
| source **déclarée absente** (« à vérifier ») | 18 |
| fiches citant un site | 14 — 13 répondent, 1 refuse (délai), 0 mort |
| **à relire** | **43**, dans 24 pays |

Les 43 se concentrent : 20 en Afrique de l'Ouest (Sénégal 5, Mali 3,
Bénin, Burkina, Guinée, Togo 2 chacun, Cameroun, Côte d'Ivoire 2,
Botswana) — presque toutes des fumoirs d'hôtel écrits « à vérifier »
dès l'origine —, 9 en Europe (Espagne 5), 7 aux Amériques, 7 en Asie et
au Moyen-Orient.

## Lot 19 — les 43 à relire, et les réseaux (migration 232)

*17 septembre 2026.* Cinq lots géographiques, un `expert-cigare` par
lot, puis un second en contradicteur sur chaque « introuvable » : aucun
n'a été réfuté. Trois relances ont été nécessaires — la limite de
session tuait les agents en vol ; le workflow rejoue ce qui est acquis.

### La méthode a tenu, et elle a coûté

Les relecteurs cherchent en langue locale (portugais, espagnol,
hébreu, japonais, coréen, chinois, turc, persan, français) et en
anglais, trois à six requêtes par fiche, puis lisent les pages
prometteuses. Deux lots ont épuisé leur quota de recherche en route et
ont fini au fetch direct de moteurs — ils le disent dans leur méthode.
Deux lectures indépendantes des Amériques (matin et après-midi) ont
rendu les mêmes faits sous deux étiquettes (« introuvable » /
« incertain ») : la divergence est écrite, pas tranchée.

### Ce que les 43 sont devenues

| sort | fiches | pourquoi |
|---|---|---|
| **dépubliées** (`is_verified = 0`) | 30 | 20 que rien n'atteste, à deux lecteurs ; 8 que l'établissement **dément** en publiant la liste de ses bars sans cigares (155) ; 2 dont on ignore de quel lieu elles parlent |
| **gardées « à vérifier — relu le 17 septembre 2026 »** | 11 | l'hôtel existe, aucune liste de bars consultable ; on ne retire pas sur le silence |
| **corrigées** | 2 | l'établissement existe, la fiche se trompait |
| **ajoutées** | 2 | trouvées en cherchant, sourcées par le site du lieu |

**Les vingt que rien n'atteste.** Huit enseignes européennes — Au
Régal du Palais (Strasbourg), Tabacs Petitjean (Nancy), Tabaccheria
Guidi (Bologne), Estanco 1 (Madrid), Club Pasión Habanos à Barcelone
(le club est madrilène, calle Ferraz 2), El Humidor (Séville), Tabaco
& Ron (Málaga), El Gran Fumador (Saint-Sébastien) — dont aucun
annuaire, registre ni presse ne connaît le nom à l'adresse écrite,
et dont les vraies caves de la ville portent d'autres noms. Six en
Asie et au Moyen-Orient (Herzliya, Kyoto — « Okitayamacho » n'est
aucun des 262 quartiers de Higashiyama-ku —, Séoul, Taipei, Istanbul,
Bodrum). Quatre aux Amériques : Casa do Charuto Brasília (la liste
des tabacarias du distributeur Habanos en cite quatre, pas celle-ci),
Casa de Habanos Providencia (le réseau n'a qu'une Casa au Chili, la
fiche 159), Tobacco Road et Havana Connections (chaîne de Virginie,
rien à Tampa). Deux en Afrique : Le Sultan à Bamako, le Polo Club à
Gaborone.

**Les huit que l'établissement dément, et deux composites.** C'est le sort des onze de la
migration 155, et la nouveauté de ce recensement : les hôtels d'Afrique
de l'Ouest gardés en 155 « faute de liste de bars consultable »
publient aujourd'hui leurs bars. Noom Hotel Dakar Sea Plaza —
l'ex-Radisson Blu, renommé en janvier 2025, et route de la Corniche
Ouest, pas route de King Fahd — détaille Onyx Bar, Rooftop Bar,
Infinity Pool Bar ; King Fahd Palace ses quatre adresses ; Terrou-Bi
ses six ; Le Lagon 1 sa salle sur pilotis, son ponton, sa plage ;
Novotel Cotonou Orisha deux bars ; Noom Conakry deux ; Sarakawa Lomé
quatre ; le Zenit Diplomatic d'Andorre ses espaces — et aucun n'est un
salon cigares. Plus deux fiches dont on ignore de quel lieu elles
parlent : La Falaise à Douala (deux hôtels de ce nom, aucun rue
Flatters) et un « Mercure Lomé » que rien ne distingue du Sarakawa.

**Les onze gardées.** Azalaï Hôtel Bamako (l'ex-Salam, renommé sur la
fiche), Azalaï Grand Hôtel, Hôtel des Almadies, Hôtel du Lac
(téléphone corrigé d'après son site), Laïco et Splendid à Ouagadougou
(l'adresse divergente du Splendid est écrite), Palm Camayenne, les
deux Cigarro CI d'Abidjan (« fourni par l'établissement — relu » : le
compte Instagram porte les deux adresses, il est sur la fiche),
Parsian Azadi à Téhéran (une salle fumeurs en persan), Altamira Suites
à Caracas. Toutes datées : l'outil ne les redemandera pas avant
dix-huit mois.

**Les deux corrigées, les deux ajoutées.** Le « Cigar Club, San
Martín 501 » de Viña del Mar est le Habanos Lounge du casino Enjoy,
San Martín 199, que habanos.com répertorie ; le « Cigar Club Bogotá,
Calle 82 no 12-18 » est La Cava del Puro, Calle 82 no 12-41, boutique
et bar, horaires et téléphone sur son site — qui publie aussi Medellín
et Carthagène, ajoutées (#2566, #2567).

### Les réseaux, lus à la machine

Les six agents réseaux ont été tués trois fois par la limite de
session avant d'avoir lu quoi que ce soit — et le localisateur
habanos.com est une carte JavaScript, illisible pour un robot. Mais son
plan de site (`wp-sitemap-posts-place-1..3.xml`) liste **4 437 pages
« place »**, une par point de vente, chacune portant nom, type (La
Casa del Habano, Habanos Specialist, Habanos Point, Habanos
Lounge/Terrace, Cohiba Atmosphere), adresse, pays, distributeur. Elles
ont été lues toutes, une fois, et recoupées par ville, pays et type
(`habanos_fetch.py`, `habanos_match.py`, dans le carnet de session).
L'annuaire se trompe parfois de pays — Bahreïn est « Bahamas », Busan
« República Checa » — d'où un recoupement par la ville d'abord.

| réseau | fiches | présentes dans leur ville | absentes d'un pays couvert → dépubliées | nommées Casa, classées Specialist | pays non couvert | corrigées |
|---|---|---|---|---|---|---|
| La Casa del Habano | 115 | 85 | 13 | 2 (Mascate, Chiang Mai) | 13 | 2 (Bakou → C-Gars Lounge ; Djeddah → La Casa Cubana) |
| Cohiba Atmosphere | 20 | 12 | 8 | — | — | — |

Les 97 présentes prennent la date dans leur source ; c'est une présence
**en ville**, pas adresse par adresse. Les 21 absentes sont dépubliées
comme en 135 et 142 : Montréal et Toronto (le Canada n'a que Windsor),
Gand (Limburgstraat est La Casa del Tabaco, chaîne belge), Larnaca,
León, Kiev (Jytomyr seule), Séoul, Madrid (aucune Casa en Espagne,
Club Pasión Habanos est calle Ferraz 2), Dubrovnik, Tbilissi (que la
fiche rangeait en Azerbaïdjan), Phnom Penh, Riyad et Khobar (La Casa
Cubana a remplacé les Casas saoudiennes) ; et les Cohiba Atmosphere de
Tirana, Anvers, Rio, Shanghai (deux), Shenzhen, Cancún et Busan, que
l'annuaire ne connaît pas — la Chine n'en a qu'à Pékin et Chengdu. Les
treize fiches d'Aruba, Barbade, Botswana, Caïmans, Égypte, Guatemala,
Jamaïque, Mali, Paraguay, Saint-Martin, Togo et Venezuela sont dans des
pays où l'annuaire n'a **aucun** lieu : rien conclu, et écrit sur la
fiche. Les cinq fiches « autre » (showroom Partagás, Festival, Habanos
House Paris, WIP Kuala Lumpur, El Fumador Dakar) ne relèvent pas de
l'annuaire des points de vente.

Davidoff : le localisateur de davidoff.com est une application
Next.js derrière une vérification d'âge ; lu depuis le navigateur
intégré sans la franchir, il liste 49 « stores » (États-Unis, Chine,
Hong Kong, Japon, Asie du Sud-Est, trois Wolsdorff en Allemagne,
Bruxelles Sablon, Bucarest, Belgrade, les satellites d'aéroport dont
Dakar), 14 « partners » (États-Unis, Tyrol, Monaco) et un onglet
« authorized merchants » plafonné à cinquante entrées américaines. Il
ne porte ni Genève rue de Rive ni Londres St James's : il est
**partiel**, et on n'en conclut aucune absence. Les 36 fiches Davidoff
restent « réseau », à recouper autrement.

## Lot 20 — les réseaux à deux sources (migration 233)

*18 septembre 2026.* Le lot 19 avait conclu les absences de réseau sur
**un** annuaire, les 4 437 pages « place » de habanos.com. Il était
incomplet, et deux fiches dépubliées la veille en portaient la preuve
dans leur propre texte : Tbilissi « inaugurée le 20 octobre 2025 »,
León « inaugurée en octobre 2024 ».

### La seconde source

Le site de la franchise, **lacasadelhabano.com**, tient un plan des
franchises — 180 marqueurs, état du 30 août 2026 — derrière une
vérification d'âge qui cache les marqueurs mais pas leurs
**catégories** : région → pays → ville, avec le compte par ville, lues
dans le flux que la page injecte. Et une chronique datée des
ouvertures, lisible par ses métadonnées : Tbilissi ouverte le 20 octobre
2025 (annonce du 3 novembre), León le 13 octobre 2023 (annonce du
7 novembre 2023, Plaza Campestre, humidor sur deux niveaux), la
Colombie le 28 décembre 2025, Montreux en juin 2026.

Les deux listes officielles ne se recouvrent pas : le plan compte des
Casas à Riyad (2), Khobar, Djeddah, Madrid, Mascate et Chiang Mai que
l'annuaire ignore ou classe autrement ; l'annuaire a Paphos, Bonn,
Rabat, Mendrisio, Belgrade, Téhéran, Rishon LeZion que le plan n'a pas.
**Ni l'un ni l'autre ne suffit seul** — c'est la règle qui sort de ce
lot, et elle est écrite dans `CLAUDE.md` : une absence ne se conclut que
sur deux listes officielles, ou sur une liste et la parole de
l'établissement.

| Casas del Habano | fiches | |
|---|---|---|
| restaurées | 8 | Tbilissi (sous la Géorgie, créée : pays, drapeau aux cinq croix, coordonnées), León (date corrigée : 2023), Riyad, Khobar, Djeddah (retrouve son nom de Casa, l'écart de l'annuaire écrit), Madrid, Montréal et Toronto avec réserve (le plan compte deux Casas au Canada, Windsor et une sans ville) |
| requalifiées | 2 | Mascate, Chiang Mai : Casas au plan, Specialist à l'annuaire — les deux écrits, le type de Casa rendu |
| confirmées par le plan seul | 7 | Aruba, Caïmans, Guatemala, Jamaïque (deux), Saint-Martin, Togo — pays que l'annuaire ne couvre pas |
| présentes dans les deux | 76 | le plan s'ajoute à la source |
| dépubliées, absentes des deux | 6 | Barbade (annoncée par la franchise en 2012, plus listée), Botswana, Mali, Paraguay (encore citée en 2016), Venezuela, Égypte |

### Davidoff, lu en entier

Le localisateur de davidoff.com ne s'arrête pas à sa cinquième page ;
ses données se lisent dans les propriétés que la page charge : **56
boutiques en propre** (Genève rue de Rive est page six), 14 partenaires,
**1 636 dépositaires** dans 44 pays — Amérique du Nord, Europe,
Amérique latine, Hong Kong, Japon, Côte d'Ivoire (deux Zino Cigares à
Abidjan) —, sans la Grèce, la Serbie, Israël, la Corée, l'Indonésie, le
Nigeria ni les Caraïbes, et la France par ses seuls satellites de
Roissy.

| Davidoff | fiches | |
|---|---|---|
| corrigées | 4 | Tokyo (Ginza 8-5-6, pas Ginza Six), Las Vegas (3200 Las Vegas Blvd, pas le Palazzo), Belgrade (Đure Jakšića 2, pas Knez Mihailova), Londres (Davidoff of London, la boutique d'Edward Sahakian, est un dépositaire agréé, pas une boutique en propre) |
| dépubliées, absentes d'un pays couvert | 15 | São Paulo, Toronto, Santiago, Medellín (le dépositaire y est La Cava del Puro), Milan, Rome, Luxembourg, Madrid, Barcelone, Miami Bal Harbour, Beverly Hills, Hong Kong IFC, Manille SM Megamall, Taipei Shin Kong, Shanghai Plaza 66 |
| gardées, pays non couvert | 17 | Andorre, Erevan, Aruba, Barbade, Caïmans, Paris, Bordeaux, Marseille, Gibraltar, Athènes, Bali, Tel Aviv, Abuja, Séoul, Saint-Kitts, Saint-Martin, Istanbul |

Et La Cava del Puro (Bogotá, Medellín, Carthagène) est dépositaire
Davidoff selon le localisateur : une seconde source officielle pour les
trois fiches du lot 19. **359 → 345 fiches publiables.**

Pistes laissées : Zino Cigares (deux adresses à Abidjan, dépositaire
Davidoff), Davidoff of Geneva Sydney, Bruxelles Sablon et Bucarest,
La Casa del Habano de Montreux et d'Andorre — des lieux que les
annuaires portent et que l'atlas n'a pas.

## Lot 21 — les douze adresses que les annuaires portent (migration 235)

*18 septembre 2026.* Les pistes du lot 20, cherchées une à une par un
`expert-cigare` (site propre, presse datée, 89 lectures) : douze
entrent, avec leurs divergences écrites.

| | fiches | source primaire |
|---|---|---|
| Casas del Habano suisses absentes de l'atlas | 5 | Genève rue de Hesse (inaugurée les 10-11 octobre 2025 ; deux adresses et deux horaires selon la source), Montreux (Fairmont, mars 2026 — 19 selon le réseau, 20 selon son site), Zoug (3 février 2024), Samnaun (janvier 2024, deux téléphones), Kreuzlingen (27 juin 2026) — leur site et la presse du métier |
| Casa d'Andorre | 1 | les deux annuaires du réseau, rien d'autre — dit comme tel |
| boutiques en propre Davidoff of Geneva | 4 | Sydney (2025, première du pays selon Cigar Journal, horaires de la galerie), Bruxelles Sablon (aussi point de vente Habanos), Bucarest Athénée Palace (une seule liste, dit comme tel ; même adresse que la Casa de l'hôtel, fiche 76), Bucarest Băneasa (le centre commercial la liste, horaires) |
| caves Zino à Abidjan | 2 | zino.ci (horaires, téléphones), KOACI 11 décembre 2020, localisateur Davidoff — qui écrit la seconde boulevard Roume, une adresse du Plateau : le site de la maison fait foi pour la rue des Jardins |

345 → **357 fiches publiables**. Zino publie trois autres caves (Cosmos,
Sofitel, Plateau) sans rue : elles attendent une adresse.

## La relecture des traductions — le chantier suivant (migration 234, outil)

9 220 traductions, toutes « machine », aucune jamais relue. Le chantier
commence, mené par `expert-traduction`, lot par lot, une langue à la
fois, l'anglais d'abord (orthographe britannique fixée comme norme) :

- `tools/i18n_relecture.php --exporter` sort un lot (français,
  traduction en place, empreinte du français) ; `--importer` transforme
  les verdicts du relecteur en migration — textes corrigés réécrits,
  statut `relu` pour tout ce qui a été relu, et le **nom du relecteur**
  dans une colonne nouvelle, `translation_status.relecteur` (234) : le
  statut seul aurait tu que c'est un agent qui relit. Un verdict dont le
  français a bougé depuis l'export est refusé ; superlatifs zh/ar et
  cyrillique aussi.
- Cliquet `sql/i18n_relues.json` (`--figer`) : les relues ne reculent
  pas, et aucune relecture n'est sans nom — dans la campagne de tests.

Premier lot : l'anglais des pays producteurs (167 textes), des zones,
de la présence Habanos, des marchés, du lexique et des arômes (203), et
des feuilles (186) — 556 textes, six agents par moitiés (la limite de
session tue les agents en vol ; les fichiers de verdicts sont écrits
dès que prêts).

### Migration 236 — l'anglais des pays, zones, présence Habanos, marchés, lexique et arômes

*18 septembre 2026.* 370 textes relus par `expert-traduction` (quatre
agents), **343 validés tels quels, 27 corrigés** — 7 %. Ce que les
relecteurs ont trouvé, par famille :

| défaut | exemples | textes |
|---|---|---|
| calques du français | présent + *since* au lieu du present perfect (Bahamas), *go to export* pour *for export* (Pérou), *what the tobacco has of dryness* (arôme pâtisserie), *artisans come from* pour « venus de » (zone 55), *the specialist shop* pour un pluriel, *hold* pour « tenir une histoire de » (Aruba) | 10 |
| glossaire non tenu | « manufacture » rendu *workshop* au lieu de *factory* (Dominicaine, Nicaragua ×2) ; « représentation Habanos » rendu *office* au lieu de *representation* (Panama, Philippines) ; « cigares de machine » tantôt *machine cigars*, tantôt *machine-made* (Allemagne, Pays-Bas) | 7 |
| précision ou intensif perdus | « très » omis (Cameroun) ou affaibli en *largely* (Tenerife) ; *natural* ajouté (Équateur) ; « caves à cigares » rendu *cellars* seul (Japon) ; « marchés parallèles » rendu *channels* (Russie) ; sous-bois affaibli en *woodland* (arôme terre) | 6 |
| contresens et fautes | pupitre du lecteur traduit *bench* (galera) ; *wrappers there is* (États-Unis) ; préposition fautive et fragments mal recollés (Union européenne) ; fiche Panama : *no Panamanian house* pour « aucune fiche de maison panaméenne » | 4 |

Le reste — vocabulaire du métier (*wrapper/binder/filler*, *torcedor*,
*vitola*), orthographe britannique (*fertiliser*, *ageing*, *tonnes*),
réserves du français gardées comme réserves (« c'est la maison qui le
dit ») — est tenu partout. Le slug des migrations ne passe plus par
`iconv`, dont la translittération dépend de la plateforme (WAMP écrit
`pr_esence`). Les feuilles (186 textes) suivent dans une migration à
part.

### Migration 237 — l'anglais des feuilles

*23 septembre 2026.* 186 textes — genèse, culture, caractères, notes,
accords et emploi des trente feuilles — relus par `expert-traduction`
(deux agents), **166 validés tels quels, 20 corrigés** : 11 %, contre
7 % pour les pays. Les feuilles sont le texte le plus technique de
l'atlas, et le glossaire y est le plus sollicité.

| défaut | exemples | textes |
|---|---|---|
| glossaire non tenu | « caves » rendues *merchants* (Didiévi, Tiébissou), « plein soleil » *full sun* (Cameroun), « fabriques » *workshops* (La Palma), *moho azul* omis (Corojo hondurien, Criollo 98) | 6 |
| « douceur » rendue *sweetness* | Besuki et Mata Fina (caractères, notes), le Connecticut vu depuis la fiche du Habano équatorien — *mildness* dans les cinq autres fiches, *mild* dans les arômes | 4 |
| calques et tournures | *can be heard* pour « s'entend », *depending on the case*, *frailty to disease*, *on the foothills*, un passé pour un présent (Habano équatorien) | 7 |
| ajouts, renforcements, forme | *disease-resistant* pour « résistante », *strikingly* pour « très », un siècle en chiffres | 3 |

Deux corrections d'agent ont été reprises par la session principale
avant l'import (*this fungus*, calque de « ce champignon » ; *makes the
country's name*, non idiomatique) — la retouche est écrite dans le
motif. Un agent avait recopié l'empreinte de la ligne voisine : le
contrôle d'ordre et d'empreintes avant import l'a arrêtée. **556
traductions anglaises relues sur 1 856, 47 corrigées.**
