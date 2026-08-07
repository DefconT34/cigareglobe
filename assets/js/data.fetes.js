/* data.fetes.js */
// data.fetes.js — Fete nationale de chaque pays, par code ISO alpha-2
//
// ════════════════════════════════════════════════════════
// Ce n'est PAS un instantane de l'API.
// ────────────────────────────────────────────────────────
// Les autres fichiers data.*.js dupliquent du contenu servi par
// backend/data.php, et docs/i18n.md documente les degats que cela a
// causes (HABANOS_DATA ecrasait la reponse traduite). Ici, rien de tel :
// aucune table ne porte ces dates, et il n'y a rien a traduire dans un
// jour, un mois et une annee. Les LIBELLES, eux, passent par t() et
// vivent dans i18n.js comme tout le reste.
//
// C'est aussi ce qui evite de faire retomber les compteurs de
// traduction : verser 89 pays dans des colonnes traduisibles aurait
// ajoute autant de valeurs vides aux six langues.
//
// FORMAT   ISO: [mois, jour, annee, type]
//   mois/jour : 1-12 / 1-31, dans le calendrier gregorien
//   annee     : annee de l'evenement, ou null si la fete n'en marque pas
//   type      : 'i' = independance · 'n' = fete nationale
//
// LE TYPE N'EST PAS DECORATIF. Tous les pays ne celebrent pas une
// independance : la France, la Suisse, le Japon ou l'Ethiopie n'en ont
// jamais eu a conquerir. Leur attribuer un « Jour de l'independance »
// serait faux, d'ou les deux libelles distincts.
//
// ARBITRAGES — plusieurs pays ont une date d'independance ET une fete
// nationale differente. On retient la FETE OFFICIELLE, celle que le pays
// celebre reellement :
//   BH  independance 15/08/1971, mais National Day le 16 decembre
//   CM  independance 01/01/1960, mais Fete nationale le 20 mai
//   EG  independance 28/02/1922, mais Revolution Day le 23 juillet
//   QA  independance 03/09/1971, mais National Day le 18 decembre
//   BG  independance 22/09/1908, mais Liberation Day le 3 mars
//   CU  10 octobre (Grito de Yara) plutot que le 1er janvier
//
// ABSENTS, VOLONTAIREMENT :
//   EU  l'Union europeenne n'est pas un pays
//   GB  le Royaume-Uni n'a pas de fete nationale officielle
//   HK  region administrative speciale, pas un Etat independant
//   KY  Constitution Day tombe le premier lundi de juillet — date mobile,
//       que ce format a date fixe ne sait pas exprimer
//   IL  la date reelle suit le calendrier hebraique et se deplace chaque
//       annee dans le calendrier gregorien ; 14/05/1948 est la date de la
//       declaration, pas celle de la celebration
//
// A RELIRE. Ces 89 dates sont saisies de memoire, pas extraites d'une
// source faisant autorite. La lecon des traductions vaut ici : une
// valeur presente n'est pas une valeur verifiee.
// ════════════════════════════════════════════════════════

var FETES_NATIONALES = {
  AD: [ 9,  8, null, 'n'],  // Andorre — Nostra Senyora de Meritxell
  AE: [12,  2, 1971, 'i'],  // Emirats arabes unis — Union Day
  AL: [11, 28, 1912, 'i'],  // Albanie — de l'Empire ottoman
  AM: [ 9, 21, 1991, 'i'],  // Armenie — de l'URSS
  AR: [ 7,  9, 1816, 'i'],  // Argentine — de l'Espagne
  AT: [10, 26, 1955, 'n'],  // Autriche — declaration de neutralite
  AU: [ 1, 26, null, 'n'],  // Australie — Australia Day
  AW: [ 3, 18, null, 'n'],  // Aruba — Jour du drapeau et de l'hymne
  AZ: [ 5, 28, 1918, 'i'],  // Azerbaidjan — Republic Day
  BB: [11, 30, 1966, 'i'],  // Barbade — du Royaume-Uni
  BE: [ 7, 21, 1831, 'n'],  // Belgique — prestation de serment de Leopold Ier
  BF: [ 8,  5, 1960, 'i'],  // Burkina Faso — de la France
  BG: [ 3,  3, 1878, 'n'],  // Bulgarie — Liberation Day
  BH: [12, 16, null, 'n'],  // Bahrein — National Day
  BJ: [ 8,  1, 1960, 'i'],  // Benin — de la France
  BR: [ 9,  7, 1822, 'i'],  // Bresil — du Portugal
  BW: [ 9, 30, 1966, 'i'],  // Botswana — du Royaume-Uni
  CA: [ 7,  1, 1867, 'n'],  // Canada — Canada Day, Confederation
  CH: [ 8,  1, 1291, 'n'],  // Suisse — Pacte federal
  CI: [ 8,  7, 1960, 'i'],  // Cote d'Ivoire — de la France
  CL: [ 9, 18, 1810, 'i'],  // Chili — premiere junte nationale
  CM: [ 5, 20, null, 'n'],  // Cameroun — Fete nationale de l'unite
  CN: [10,  1, 1949, 'n'],  // Chine — fondation de la Republique populaire
  CO: [ 7, 20, 1810, 'i'],  // Colombie — de l'Espagne
  CR: [ 9, 15, 1821, 'i'],  // Costa Rica — de l'Espagne
  CU: [10, 10, 1868, 'i'],  // Cuba — Grito de Yara
  CY: [10,  1, 1960, 'i'],  // Chypre — du Royaume-Uni
  CZ: [10, 28, 1918, 'i'],  // Republique tcheque — Etat tchecoslovaque
  DE: [10,  3, 1990, 'n'],  // Allemagne — Jour de l'unite allemande
  DO: [ 2, 27, 1844, 'i'],  // Republique dominicaine — d'Haiti
  EC: [ 8, 10, 1809, 'i'],  // Equateur — Primer Grito de Independencia
  EG: [ 7, 23, 1952, 'n'],  // Egypte — Revolution Day
  ES: [10, 12, null, 'n'],  // Espagne — Fiesta Nacional
  ET: [ 5, 28, 1991, 'n'],  // Ethiopie — Derg Downfall Day
  FR: [ 7, 14, 1789, 'n'],  // France — prise de la Bastille et Fete de la Federation
  GH: [ 3,  6, 1957, 'i'],  // Ghana — du Royaume-Uni
  GI: [ 9, 10, null, 'n'],  // Gibraltar — National Day
  GN: [10,  2, 1958, 'i'],  // Guinee — de la France
  GR: [ 3, 25, 1821, 'i'],  // Grece — de l'Empire ottoman
  GT: [ 9, 15, 1821, 'i'],  // Guatemala — de l'Espagne
  HN: [ 9, 15, 1821, 'i'],  // Honduras — de l'Espagne
  HR: [ 6, 25, 1991, 'i'],  // Croatie — de la Yougoslavie
  ID: [ 8, 17, 1945, 'i'],  // Indonesie — des Pays-Bas
  IL: [ 5, 14, 1948, 'i'],  // Israel — declaration d'independance (voir en-tete)
  IN: [ 8, 15, 1947, 'i'],  // Inde — du Royaume-Uni
  IR: [ 2, 11, 1979, 'n'],  // Iran — Revolution islamique
  IT: [ 6,  2, 1946, 'n'],  // Italie — Fete de la Republique
  JM: [ 8,  6, 1962, 'i'],  // Jamaique — du Royaume-Uni
  JP: [ 2, 11, null, 'n'],  // Japon — Fete de la fondation nationale
  KE: [12, 12, 1963, 'i'],  // Kenya — du Royaume-Uni
  KH: [11,  9, 1953, 'i'],  // Cambodge — de la France
  KN: [ 9, 19, 1983, 'i'],  // Saint-Christophe-et-Nieves — du Royaume-Uni
  KR: [ 8, 15, 1945, 'i'],  // Coree du Sud — Gwangbokjeol, liberation
  KW: [ 2, 25, 1961, 'i'],  // Koweit — du Royaume-Uni
  LB: [11, 22, 1943, 'i'],  // Liban — de la France
  LU: [ 6, 23, null, 'n'],  // Luxembourg — anniversaire du Grand-Duc
  MA: [11, 18, 1956, 'i'],  // Maroc — de la France
  MC: [11, 19, null, 'n'],  // Monaco — Fete du Prince
  ML: [ 9, 22, 1960, 'i'],  // Mali — de la France
  MX: [ 9, 16, 1810, 'i'],  // Mexique — Grito de Dolores
  MY: [ 8, 31, 1957, 'i'],  // Malaisie — Hari Merdeka
  NG: [10,  1, 1960, 'i'],  // Nigeria — du Royaume-Uni
  NI: [ 9, 15, 1821, 'i'],  // Nicaragua — de l'Espagne
  NL: [ 4, 27, null, 'n'],  // Pays-Bas — Koningsdag
  OM: [11, 18, null, 'n'],  // Oman — National Day
  PA: [11,  3, 1903, 'i'],  // Panama — de la Colombie
  PE: [ 7, 28, 1821, 'i'],  // Perou — de l'Espagne
  PH: [ 6, 12, 1898, 'i'],  // Philippines — de l'Espagne
  PL: [11, 11, 1918, 'i'],  // Pologne — restauration de l'independance
  PT: [ 6, 10, null, 'n'],  // Portugal — Dia de Portugal
  PY: [ 5, 15, 1811, 'i'],  // Paraguay — de l'Espagne
  QA: [12, 18, null, 'n'],  // Qatar — National Day
  RO: [12,  1, 1918, 'n'],  // Roumanie — Grande Union
  RS: [ 2, 15, 1804, 'n'],  // Serbie — Fete de l'Etat
  RU: [ 6, 12, 1990, 'n'],  // Russie — Jour de la Russie
  SA: [ 9, 23, 1932, 'n'],  // Arabie saoudite — unification du royaume
  SG: [ 8,  9, 1965, 'i'],  // Singapour — de la Malaisie
  SN: [ 4,  4, 1960, 'i'],  // Senegal — de la France
  SX: [11, 11, null, 'n'],  // Saint-Martin — Sint Maarten Day
  TG: [ 4, 27, 1960, 'i'],  // Togo — de la France
  TH: [12,  5, null, 'n'],  // Thailande — Fete nationale
  TR: [10, 29, 1923, 'n'],  // Turquie — Fete de la Republique
  TW: [10, 10, 1911, 'n'],  // Taiwan — Double Dix
  TZ: [12,  9, 1961, 'i'],  // Tanzanie — du Royaume-Uni
  UA: [ 8, 24, 1991, 'i'],  // Ukraine — de l'URSS
  US: [ 7,  4, 1776, 'i'],  // Etats-Unis — du Royaume-Uni
  VE: [ 7,  5, 1811, 'i'],  // Venezuela — de l'Espagne
  VN: [ 9,  2, 1945, 'i'],  // Viet Nam — de la France
  ZA: [ 4, 27, 1994, 'n'],  // Afrique du Sud — Freedom Day
};

/**
 * Code ISO alpha-2 d'un drapeau emoji.
 *
 * Les tables ne portent pas toutes un code : lounge_countries.iso_code
 * est vide sur 19 des 93 lignes, et producer_countries n'en a aucun. Le
 * drapeau, lui, est present partout et l'encode deja — deux « indicateurs
 * regionaux » Unicode qui sont les deux lettres decalees de 0x1F1E6.
 *
 * S'appuyer dessus evite d'ajouter une colonne, et fonctionne meme la ou
 * iso_code manque. Retourne '' si le drapeau n'en est pas un.
 */
function isoDepuisDrapeau(drapeau) {
  if (!drapeau) return '';
  var out = '';
  for (var i = 0; i < drapeau.length; i++) {
    var cp = drapeau.codePointAt(i);
    if (cp >= 0x1F1E6 && cp <= 0x1F1FF) {
      out += String.fromCharCode(cp - 0x1F1E6 + 65);
      i++; // paire de substitution : sauter la moitie basse
    }
  }
  return out.length === 2 ? out : '';
}

window.FETES_NATIONALES = FETES_NATIONALES;
window.isoDepuisDrapeau = isoDepuisDrapeau;
