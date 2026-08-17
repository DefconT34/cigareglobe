/* data.pays.js */
// data.pays.js — Devise, langue officielle et fuseau, par code ISO alpha-2
//
// ════════════════════════════════════════════════════════
// Même principe que data.fetes.js, et pour la même raison : ce sont des
// CODES, pas du texte. « EUR », « fr », « Europe/Paris » ne se traduisent
// pas — c'est Intl qui, à l'exécution, en donne le nom dans la langue du
// visiteur. Aucune chaîne à recopier en six langues, donc aucune dette de
// traduction ajoutée, et une septième langue ne demanderait rien ici.
//
//   Intl.DisplayNames(lang, {type:'currency'}).of('CUP')   → « peso cubain »
//   Intl.DisplayNames(lang, {type:'language'}).of('es')    → « espagnol »
//   Intl.DateTimeFormat(lang, {timeZone:'America/Havana'}) → l'heure là-bas
//
// FORMAT   ISO: [devise, langues, fuseau]
//   devise  : code ISO 4217
//   langues : codes ISO 639-1, séparés par des virgules, les principales
//             d'abord — trois au plus, l'encart n'a pas la place pour les
//             onze langues officielles d'un pays comme l'Afrique du Sud
//   fuseau  : identifiant IANA
//
// LE FUSEAU EST CELUI DE LA CAPITALE, et c'est un choix, pas un oubli :
// les États-Unis en comptent six, la Russie onze, le Brésil quatre. Une
// heure unique pour ces pays est nécessairement approximative — l'encart
// le signale en nommant le fuseau plutôt qu'en affichant l'heure seule.
//
// À RELIRE, comme les dates de fête : saisi de mémoire. Les devises
// changent (le Venezuela a redénominé trois fois depuis 2008, la Croatie
// est passée à l'euro en 2023) et les fuseaux aussi.
// ════════════════════════════════════════════════════════

var PAYS_INFOS = {
  AD: ['EUR', 'ca',       'Europe/Andorra'],
  AE: ['AED', 'ar',       'Asia/Dubai'],
  AL: ['ALL', 'sq',       'Europe/Tirane'],
  AM: ['AMD', 'hy',       'Asia/Yerevan'],
  AR: ['ARS', 'es',       'America/Argentina/Buenos_Aires'],
  AT: ['EUR', 'de',       'Europe/Vienna'],
  AU: ['AUD', 'en',       'Australia/Sydney'],
  AW: ['AWG', 'nl',       'America/Aruba'],
  AZ: ['AZN', 'az',       'Asia/Baku'],
  BB: ['BBD', 'en',       'America/Barbados'],
  BE: ['EUR', 'nl,fr,de', 'Europe/Brussels'],
  BF: ['XOF', 'fr',       'Africa/Ouagadougou'],
  BG: ['BGN', 'bg',       'Europe/Sofia'],
  BH: ['BHD', 'ar',       'Asia/Bahrain'],
  BJ: ['XOF', 'fr',       'Africa/Porto-Novo'],
  BR: ['BRL', 'pt',       'America/Sao_Paulo'],
  BW: ['BWP', 'en,tn',    'Africa/Gaborone'],
  CA: ['CAD', 'en,fr',    'America/Toronto'],
  CH: ['CHF', 'de,fr,it', 'Europe/Zurich'],
  CI: ['XOF', 'fr',       'Africa/Abidjan'],
  CL: ['CLP', 'es',       'America/Santiago'],
  CM: ['XAF', 'fr,en',    'Africa/Douala'],
  CN: ['CNY', 'zh',       'Asia/Shanghai'],
  CO: ['COP', 'es',       'America/Bogota'],
  CR: ['CRC', 'es',       'America/Costa_Rica'],
  CU: ['CUP', 'es',       'America/Havana'],
  CY: ['EUR', 'el,tr',    'Asia/Nicosia'],
  CZ: ['CZK', 'cs',       'Europe/Prague'],
  DE: ['EUR', 'de',       'Europe/Berlin'],
  DO: ['DOP', 'es',       'America/Santo_Domingo'],
  EC: ['USD', 'es',       'America/Guayaquil'],
  EG: ['EGP', 'ar',       'Africa/Cairo'],
  ES: ['EUR', 'es',       'Europe/Madrid'],
  ET: ['ETB', 'am',       'Africa/Addis_Ababa'],
  FR: ['EUR', 'fr',       'Europe/Paris'],
  GB: ['GBP', 'en',       'Europe/London'],
  GH: ['GHS', 'en',       'Africa/Accra'],
  GI: ['GIP', 'en',       'Europe/Gibraltar'],
  GN: ['GNF', 'fr',       'Africa/Conakry'],
  GR: ['EUR', 'el',       'Europe/Athens'],
  GT: ['GTQ', 'es',       'America/Guatemala'],
  HK: ['HKD', 'zh,en',    'Asia/Hong_Kong'],
  HN: ['HNL', 'es',       'America/Tegucigalpa'],
  HR: ['EUR', 'hr',       'Europe/Zagreb'],
  ID: ['IDR', 'id',       'Asia/Jakarta'],
  IL: ['ILS', 'he,ar',    'Asia/Jerusalem'],
  IN: ['INR', 'hi,en',    'Asia/Kolkata'],
  IR: ['IRR', 'fa',       'Asia/Tehran'],
  IT: ['EUR', 'it',       'Europe/Rome'],
  JM: ['JMD', 'en',       'America/Jamaica'],
  JP: ['JPY', 'ja',       'Asia/Tokyo'],
  KE: ['KES', 'sw,en',    'Africa/Nairobi'],
  KH: ['KHR', 'km',       'Asia/Phnom_Penh'],
  KN: ['XCD', 'en',       'America/St_Kitts'],
  KR: ['KRW', 'ko',       'Asia/Seoul'],
  KW: ['KWD', 'ar',       'Asia/Kuwait'],
  KY: ['KYD', 'en',       'America/Cayman'],
  LB: ['LBP', 'ar',       'Asia/Beirut'],
  LU: ['EUR', 'lb,fr,de', 'Europe/Luxembourg'],
  MA: ['MAD', 'ar',       'Africa/Casablanca'],
  MC: ['EUR', 'fr',       'Europe/Monaco'],
  MF: ['EUR', 'fr',       'America/Marigot'],
  ML: ['XOF', 'fr',       'Africa/Bamako'],
  MX: ['MXN', 'es',       'America/Mexico_City'],
  MY: ['MYR', 'ms',       'Asia/Kuala_Lumpur'],
  NG: ['NGN', 'en',       'Africa/Lagos'],
  NI: ['NIO', 'es',       'America/Managua'],
  NL: ['EUR', 'nl',       'Europe/Amsterdam'],
  OM: ['OMR', 'ar',       'Asia/Muscat'],
  PA: ['PAB', 'es',       'America/Panama'],
  PE: ['PEN', 'es',       'America/Lima'],
  PH: ['PHP', 'fil,en',   'Asia/Manila'],
  PL: ['PLN', 'pl',       'Europe/Warsaw'],
  PT: ['EUR', 'pt',       'Europe/Lisbon'],
  PY: ['PYG', 'es,gn',    'America/Asuncion'],
  QA: ['QAR', 'ar',       'Asia/Qatar'],
  RO: ['RON', 'ro',       'Europe/Bucharest'],
  RS: ['RSD', 'sr',       'Europe/Belgrade'],
  RU: ['RUB', 'ru',       'Europe/Moscow'],
  SA: ['SAR', 'ar',       'Asia/Riyadh'],
  SG: ['SGD', 'en,ms,zh', 'Asia/Singapore'],
  SN: ['XOF', 'fr',       'Africa/Dakar'],
  SX: ['ANG', 'nl,en',    'America/Lower_Princes'],
  TG: ['XOF', 'fr',       'Africa/Lome'],
  TH: ['THB', 'th',       'Asia/Bangkok'],
  TR: ['TRY', 'tr',       'Europe/Istanbul'],
  TW: ['TWD', 'zh',       'Asia/Taipei'],
  TZ: ['TZS', 'sw,en',    'Africa/Dar_es_Salaam'],
  UA: ['UAH', 'uk',       'Europe/Kyiv'],
  US: ['USD', 'en',       'America/New_York'],
  VE: ['VES', 'es',       'America/Caracas'],
  VN: ['VND', 'vi',       'Asia/Ho_Chi_Minh'],
  ZA: ['ZAR', 'en,af,zu', 'Africa/Johannesburg'],
};

// Pays à plusieurs fuseaux : l'heure affichée est celle de la capitale
// et ne vaut pas pour tout le territoire. On le signale plutôt que de
// laisser croire à une heure nationale unique.
var PAYS_MULTIFUSEAUX = ['US', 'RU', 'BR', 'CA', 'AU', 'MX', 'ID', 'CN'];

// ── Quand le drapeau ne suffit pas ────────────────────────
//
// La table ci-dessus est indexée par code ISO, et ce code est DÉDUIT DU
// DRAPEAU (isoDepuisDrapeau, via les indicateurs régionaux de l'emoji).
// Un territoire qui arbore le drapeau de son État hérite donc de toute
// sa ligne — devise, langue ET fuseau.
//
// Les Canaries arborent 🇪🇸. Leur fiche affichait l'heure de Madrid,
// soit UNE HEURE DE TROP toute l'année : l'archipel est à UTC+0 quand
// la péninsule est à UTC+1. Personne ne pouvait le voir sans comparer
// les deux à la même seconde.
//
// Ironie utile : `producer_geo.timezone` disait « UTC+0 », c'est-à-dire
// juste. C'est le repli qui avait raison et l'affichage qui avait tort
// — l'inverse de ce qu'on cherchait en relisant cette table.
//
// Indexé par identifiant de fiche, pas par drapeau : c'est justement le
// drapeau qui ne discrimine pas.
var TERRITOIRES_INFOS = {
  canaries: ['EUR', 'es', 'Atlantic/Canary'],
};

window.PAYS_INFOS = PAYS_INFOS;
window.PAYS_MULTIFUSEAUX = PAYS_MULTIFUSEAUX;
window.TERRITOIRES_INFOS = TERRITOIRES_INFOS;
