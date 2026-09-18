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
