# Dossier de consultation : CigarOdyssey (thecigarodyssey.com)

Destinataires : avocat (santé publique, publicité du tabac, France) et juriste d'Abidjan.
Établi le 29 octobre 2026, à partir du dépôt et de deux audits internes du même jour (réglementation tabac ; droit du numérique). Ce document pose des questions : rien n'y est une conclusion juridique. Les textes cités n'ont pas tous pu être relus (voir section 5).

## 1. Ce que fait le site

- Atlas éditorial mondial du cigare premium : maisons, pays producteurs, zones, feuilles, lexique, arômes, marchés, établissements. Six langues (français source, puis en, es, de, zh, ar ; traductions automatiques, relues en partie).
- Aucune vente, aucune publicité, aucune affiliation, aucun lien marchand (recherche négative dans le code ; page d'accueil de production lue en texte seulement). Pas de régie, pas de script tiers.
- Éditeur : une personne physique établie en Côte d'Ivoire ; hébergeur o2switch (Clermont-Ferrand, France). Monétisation envisagée plus tard (publicité display, vente de données, société), rien en place.
- Public visé : monde entier, dont la France (site rédigé en français d'abord, droit français choisi, « 18 ans en France » dans les conditions).
- Garde-fous existants : portail d'âge déclaratif (18 ans, localStorage, sans cookie) ; mention sanitaire permanente (« Le tabac nuit gravement à votre santé… », version française seulement vérifiée) ; retrait des contenus qui incitent à consommer ; fiches de lieux marquées « non vérifié » quand leur source n'est pas datée ; noindex sur les fiches de lieux et sur l'agenda.

## 2. Données collectées (backend/, legal.php)

| Donnée | Finalité | Durée |
|---|---|---|
| E-mail, nom d'affichage, mot de passe haché, langue, avatar, présentation | compte | jusqu'à suppression du compte |
| Avis, notes, favoris, listes | publication, note des lieux | supprimés avec le compte |
| Messages du forum, réactions, inscriptions aux rendez-vous | communauté | messages conservés, signés « Membre supprimé » |
| Lieux proposés : e-mail et IP du dépôt | prévenir, limiter les abus | effacés avec le compte |
| Suggestions (compte, page, langue) | corrections | effacées une fois traitées |
| Jetons de vérification / réinitialisation | preuve de l'e-mail | expirent, purgés sous 1 jour |
| Date et version des conditions acceptées | preuve | jusqu'à suppression du compte |
| Mesure d'audience maison : page, langue, domaine référent, empreinte quotidienne salée (pas d'IP, pas de cookie) | savoir si le site est lu | 25 mois |
| IP des tentatives de connexion | anti-force brute | 24 h (purge opportuniste, dépend du trafic) |
| Journal de modération (nom du modérateur) | traçabilité | sans durée fixée |

Sous-traitants : o2switch (hébergement) ; service d'envoi d'e-mails (clé API dans la configuration), non nommé dans la politique. Tuiles de carte OpenStreetMap et polices Google Fonts : requêtes directes du navigateur du visiteur (IP transmise). Sauvegarde du serveur rapatriée en local (contenu et chiffrement non audités). Export de données (art. 20) manuel par e-mail.

## 3. Pages concernées

- Fiches de lieux (caves, lounges, boutiques) : environ 357 établissements du tabac, avec téléphone, horaires, parfois prix et description (page.php:462-480). Servies mais en noindex ; accessibles par lien direct, y compris en France.
- Agenda de dégustations : réservé aux membres connectés, noindex.
- Forum et avis : contenus de membres, modérés (retrait de la publicité et de l'incitation ; trois signalements masquent un message), sans signalement « promotion » dédié ni procédure de notification type DSA.
- Mentions légales (legal.php) : en français seulement, noindex, dernière mise à jour affichée 31 août 2026.

## 4. Questions

### A. Droit français du tabac (avocat)

1. L3512-4 CSP : un contenu éditorial sur le cigare (histoire, marques, terroirs) sans vente ni lien marchand peut-il être qualifié de « propagande ou publicité, directe ou indirecte » ? Quels critères retient la jurisprudence (finalité, absence de contrepartie, ton) ?
2. Un annuaire de commerces du tabac (nom, adresse, téléphone, horaires, parfois prix) est-il une « information sur un point de vente » constitutive de publicité indirecte, même sans rémunération des établissements ? Faut-il supprimer les fiches, les réduire à des données d'annuaire neutres (sans prix ni description), ou les réserver aux membres ? Le noindex a-t-il une valeur juridique ou seulement pratique ?
3. L'agenda de dégustations réservé aux membres : l'accès restreint change-t-il la qualification ? Les avis de membres sur des commerces ?
4. Service en ligne édité hors UE : l'ancien L3511-3 contenait une exception pour les services en ligne édités hors de l'UE/EEE et ne visant pas principalement le marché européen. Le texte actuel de L3512-4 la prévoit-il et dans quels termes ? (Non relu : Légifrance indisponible lors de l'audit.) Si oui, un site en français, en droit français, avec « 18 ans en France » et six langues « vise-t-il principalement » l'Europe ? Que changerait une annonce du site en France ?
5. Responsabilité de l'éditeur pour les contenus de membres (avis, messages, photos) au regard de L3512-4 : quel dispositif de signalement et de retrait est attendu ?
6. Quelle est l'exposition pratique : associations (CNCT) et jurisprudence pénale ? L'éditeur est hors de France : quelle poursuite concrète, et quel risque pour l'hébergeur français ?
7. La mention sanitaire doit-elle suivre une forme précise (texte, traduction dans chaque langue, emplacement) ?

### B. Éditeur et droit ivoirien (juriste d'Abidjan)

8. Statut de l'éditeur : quelle forme (entreprenant, ou autre) est requise pour un site éditorial sans recettes aujourd'hui, et dès qu'une recette (publicité, vente de données) apparaît ? Obligations déclaratives, fiscales et sociales associées ?
9. Déclaration ou autorisation ARTCI et loi 2013-450 sur la protection des données à caractère personnel : formalités exactes, délai, coût ; transfert de données vers la France / l'UE ; hébergement hors de Côte d'Ivoire ; le site a-t-il des obligations pour des utilisateurs hors du pays ?
10. Responsabilité de l'éditeur ivoirien en cas de poursuite en France (reconnaissance et exécution) ; cadre ivoirien sur les contenus relatifs au tabac, et services électroniques.
11. Peut-on rester anonyme vis-à-vis du public (régime des mentions légales) selon le droit ivoirien ?

### C. Données personnelles et mentions légales (les deux)

12. Représentant UE (art. 27 RGPD) : l'art. 3(2) s'applique-t-il (six langues, comptes, public français) ? Un hébergeur en France ne vaut pas représentant ; un service de représentant (coût annuel de l'ordre de quelques centaines d'euros) est-il proportionné à une audience faible, ou le risque peut-il être assumé en connaissance de cause ?
13. Mentions légales actuelles à corriger : « personne physique non professionnelle » avec renvoi à l'art. 6-III-2 LCEN, « droit français », « saisir la CNIL ». Cela reste-t-il exact pour un éditeur ivoirien ? Quelle formulation (droit applicable, juridiction, autorité de contrôle, statut) proposer, sachant que l'éditeur ne veut pas publier son identité ?
14. Polices Google (Cinzel, Playfair, Lato) chargées depuis fonts.googleapis.com : l'IP du visiteur part chez Google sans consentement (LG München I, 20 janv. 2022, 3 O 17493/20 ; position CNIL à confirmer). Corrigeable par hébergement local ; y a-t-il un risque rétroactif, et faut-il mentionner la correction ?
15. Mesure d'audience maison sans cookie : l'exemption CNIL s'applique-t-elle à une empreinte quotidienne salée (IP + UA, non conservée) ? Stockage local (âge, thème, langue) : exemption ePrivacy plausible pour l'âge et la langue, moins nette pour le thème.
16. Clause de contenus de membres (« restent les vôtres, vous autorisez à afficher ») : licence à préciser (durée, monde, traduction, modération) ? Procédure de notification de contenu illicite (DSA art. 16, LCEN 6-I-5) : ajouter une page dédiée ? Droit de réponse d'un établissement mentionné ?
17. Conservation du journal de modération (durée à fixer, par exemple 5 ans ?) ; sous-traitants à nommer (fournisseur d'e-mails, pays, DPA) ; politique en français seulement pour un public mondial.

### D. Projet de monétisation (les deux)

18. Vente future de données à des professionnels (par exemple la base d'établissements vérifiés) : régime applicable (base de données, droit sui generis du producteur, licence contractuelle) ; les données sont-elles purement factuelles ou encore des « informations sur un point de vente » ? Le fait de vendre à des commerces du tabac fait-il basculer le site vers la publicité (intérêt économique) ? Quelle licence rédiger, et qui est le producteur (personne physique ivoirienne ou société à créer) ?
19. Publicité display et affiliation : AdSense, Meta Ads et Google Ads interdisent en principe la promotion du tabac (politiques non relues le 29/10/2026). Hors du champ juridique strict, mais la recette publicitaire changerait la qualification de L3512-4 et le statut de l'éditeur. Faut-il l'exclure définitivement ?
20. Calendrier : quelles corrections avant toute annonce publique (France, États-Unis où le seuil est 21 ans) ?

## 5. Ce qui n'a pas été vérifié

- Texte actuel de L3512-4 et sa jurisprudence récente sur l'exception hors UE (Légifrance 404 ; l'exception citée vient d'une version de 2006 de L3511-3). Crim. 20 nov. 2012, n° 12-80.530 cité de mémoire, non relu.
- Formalités ARTCI, loi 2013-450 et statut d'entreprenant en Côte d'Ivoire : non vérifiés.
- Production : une seule lecture de texte de legal.php ; ni code source rendu, ni en-têtes, ni cookies de session avant connexion.
- Mention sanitaire dans les cinq autres langues ; règles des autres pays (Suisse, Canada, Moyen-Orient, Asie).
- Contrats (DPA o2switch, fournisseur d'e-mails) et contenu de la sauvegarde rapatriée.

## 6. Sources internes

legal.php (l.109-143 éditeur et hébergeur, l.163-228 données, l.266-305 conditions) ; page.php:462-480 (fiches de lieux) ; forum.php:842-843 (noindex agenda) ; backend/audience.php, backend/auth_lib.php ; docs/communaute.md §10 (avis juridique requis avant mise en ligne).
