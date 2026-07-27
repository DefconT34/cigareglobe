/* data.lounges.js */
// data.lounges.js — Pays avec caves & lounges (triangles sur le globe)
// Les données des établissements sont chargées depuis MySQL via data.php
// ════════════════════════════════════════════════════════

var LOUNGE_COUNTRIES = [
  // Afrique
  { id:'ivorycoast', name:"Côte d'Ivoire",  flag:'🇨🇮', lat:7.5,   lon:-5.5,  color:'#8B2BE2' },
  { id:'southafrica',name:'Afrique du Sud', flag:'🇿🇦', lat:-28.4793, lon:24.6727,  color:'#8B2BE2' },
  { id:'kenya',      name:'Kenya',          flag:'🇰🇪', lat:-0.0,  lon:37.9,  color:'#8B2BE2' },
  { id:'morocco',    name:'Maroc',          flag:'🇲🇦', lat:31.8,  lon:-7.1,  color:'#8B2BE2' },
  { id:'egypt',      name:'Égypte',         flag:'🇪🇬', lat:26.8,  lon:30.8,  color:'#8B2BE2' },
  { id:'nigeria',    name:'Nigéria',        flag:'🇳🇬', lat:9.1,   lon:8.7,   color:'#8B2BE2' },
  { id:'ghana',      name:'Ghana',          flag:'🇬🇭', lat:7.9,   lon:-1.0,  color:'#8B2BE2' },
  { id:'ethiopia',   name:'Éthiopie',       flag:'🇪🇹', lat:9.1,   lon:40.5,  color:'#8B2BE2' },
  { id:'tanzania',   name:'Tanzanie',       flag:'🇹🇿', lat:-6.4,  lon:34.9,  color:'#8B2BE2' },
  { id:'botswana',   name:'Botswana',       flag:'🇧🇼', lat:-22.3, lon:24.7,  color:'#8B2BE2' },
  { id:'mali',       name:'Mali',           flag:'🇲🇱', lat:12.65, lon:-8.00,  color:'#8B2BE2' },
  // Europe
  { id:'france',     name:'France',         flag:'🇫🇷', lat:46.2,  lon:2.2,   color:'#8B2BE2' },
  { id:'spain',      name:'Espagne',        flag:'🇪🇸', lat:40.4,  lon:-3.7,  color:'#8B2BE2' },
  { id:'germany',    name:'Allemagne',      flag:'🇩🇪', lat:51.2,  lon:10.5,  color:'#8B2BE2' },
  { id:'switzerland',name:'Suisse',         flag:'🇨🇭', lat:46.8,  lon:8.2,   color:'#8B2BE2' },
  { id:'uk',         name:'Royaume-Uni',    flag:'🇬🇧', lat:55.3781,  lon:-3.436,  color:'#8B2BE2' },
  { id:'belgium',    name:'Belgique',       flag:'🇧🇪', lat:50.8,  lon:4.4,   color:'#8B2BE2' },
  { id:'netherlands',name:'Pays-Bas',       flag:'🇳🇱', lat:52.4,  lon:4.9,   color:'#8B2BE2' },
  { id:'italy',      name:'Italie',         flag:'🇮🇹', lat:41.8719,  lon:12.5674,  color:'#8B2BE2' },
  { id:'portugal',   name:'Portugal',       flag:'🇵🇹', lat:39.4,  lon:-8.2,  color:'#8B2BE2' },
  { id:'russia',     name:'Russie',         flag:'🇷🇺', lat:61.524,  lon:105.3188,  color:'#8B2BE2' },
  { id:'ukraine',    name:'Ukraine',        flag:'🇺🇦', lat:48.3794,  lon:31.1656,  color:'#8B2BE2' },
  { id:'czech',      name:'Rép. Tchèque',   flag:'🇨🇿', lat:49.8175,  lon:15.473,  color:'#8B2BE2' },
  { id:'austria',    name:'Autriche',       flag:'🇦🇹', lat:47.5162,  lon:14.5501,  color:'#8B2BE2' },
  { id:'poland',     name:'Pologne',        flag:'🇵🇱', lat:51.9194,  lon:19.1451,  color:'#8B2BE2' },
  { id:'romania',    name:'Roumanie',       flag:'🇷🇴', lat:45.9,  lon:24.9,  color:'#8B2BE2' },
  { id:'serbia',     name:'Serbie',         flag:'🇷🇸', lat:44.0,  lon:21.0,  color:'#8B2BE2' },
  { id:'croatia',    name:'Croatie',        flag:'🇭🇷', lat:45.1,  lon:15.2,  color:'#8B2BE2' },
  { id:'greece',     name:'Grèce',          flag:'🇬🇷', lat:39.1,  lon:21.8,  color:'#8B2BE2' },
  { id:'turkey',     name:'Turquie',        flag:'🇹🇷', lat:39.1,  lon:35.2,  color:'#8B2BE2' },
  { id:'luxembourg', name:'Luxembourg',     flag:'🇱🇺', lat:49.8,  lon:6.1,   color:'#8B2BE2' },
  { id:'andorra',    name:'Andorre',        flag:'🇦🇩', lat:42.5,  lon:1.5,   color:'#8B2BE2' },
  { id:'gibraltar',  name:'Gibraltar',      flag:'🇬🇮', lat:36.1,  lon:-5.4,  color:'#8B2BE2' },
  { id:'albania',    name:'Albanie',        flag:'🇦🇱', lat:41.2,  lon:20.2,  color:'#8B2BE2' },
  { id:'bulgaria',   name:'Bulgarie',       flag:'🇧🇬', lat:42.7,  lon:25.5,  color:'#8B2BE2' },
  { id:'cyprus',     name:'Chypre',         flag:'🇨🇾', lat:35.1,  lon:33.4,  color:'#8B2BE2' },
  { id:'armenia',    name:'Arménie',        flag:'🇦🇲', lat:40.1,  lon:45.0,  color:'#8B2BE2' },
  { id:'iran',       name:'Iran',           flag:'🇮🇷', lat:32.4,  lon:53.7,  color:'#8B2BE2' },
  // Moyen-Orient
  { id:'uae',        name:'Émirats',        flag:'🇦🇪', lat:23.4,  lon:53.8,  color:'#8B2BE2' },
  { id:'qatar',      name:'Qatar',          flag:'🇶🇦', lat:25.4,  lon:51.2,  color:'#8B2BE2' },
  { id:'kuwait',     name:'Koweït',         flag:'🇰🇼', lat:29.4,  lon:47.7,  color:'#8B2BE2' },
  { id:'bahrain',    name:'Bahreïn',        flag:'🇧🇭', lat:26.1,  lon:50.5,  color:'#8B2BE2' },
  { id:'lebanon',    name:'Liban',          flag:'🇱🇧', lat:33.9,  lon:35.5,  color:'#8B2BE2' },
  { id:'israel',     name:'Israël',         flag:'🇮🇱', lat:31.5,  lon:35.0,  color:'#8B2BE2' },
  { id:'oman',       name:'Oman',           flag:'🇴🇲', lat:21.5,  lon:55.9,  color:'#8B2BE2' },
  { id:'saudiarabia',name:'Arabie Saoudite',flag:'🇸🇦', lat:23.9,  lon:45.1,  color:'#8B2BE2' },
  // Asie
  { id:'japan',      name:'Japon',          flag:'🇯🇵', lat:36.2,  lon:138.3, color:'#8B2BE2' },
  { id:'china',      name:'Chine',          flag:'🇨🇳', lat:35.9,  lon:104.2, color:'#8B2BE2' },
  { id:'hongkong',   name:'Hong Kong',      flag:'🇭🇰', lat:22.3,  lon:114.2, color:'#8B2BE2' },
  { id:'taiwan',     name:'Taïwan',         flag:'🇹🇼', lat:23.7,  lon:120.9, color:'#8B2BE2' },
  { id:'southkorea', name:'Corée du Sud',   flag:'🇰🇷', lat:35.9078,  lon:127.7669, color:'#8B2BE2' },
  { id:'singapore',  name:'Singapour',      flag:'🇸🇬', lat:1.4,   lon:103.8, color:'#8B2BE2' },
  { id:'malaysia',   name:'Malaisie',       flag:'🇲🇾', lat:4.2105,   lon:101.9758, color:'#8B2BE2' },
  { id:'thailand',   name:'Thaïlande',      flag:'🇹🇭', lat:15.9,  lon:100.9, color:'#8B2BE2' },
  { id:'cambodia',   name:'Cambodge',       flag:'🇰🇭', lat:12.6,  lon:104.9, color:'#8B2BE2' },
  { id:'vietnam',    name:'Viêt Nam',       flag:'🇻🇳', lat:14.0583,  lon:108.2772, color:'#8B2BE2' },
  { id:'india',      name:'Inde',           flag:'🇮🇳', lat:20.6,  lon:78.9,  color:'#8B2BE2' },
  { id:'azerbaijan', name:'Azerbaïdjan',    flag:'🇦🇿', lat:40.1,  lon:47.6,  color:'#8B2BE2' },
  // Amériques
  { id:'canada',     name:'Canada',         flag:'🇨🇦', lat:56.1,  lon:-106.3,color:'#8B2BE2' },
  { id:'argentina',  name:'Argentine',      flag:'🇦🇷', lat:-38.4161, lon:-63.6167, color:'#8B2BE2' },
  { id:'brazil_c',   name:'Brésil',         flag:'🇧🇷', lat:-14.235, lon:-51.9253, color:'#8B2BE2' },
  { id:'chile',      name:'Chili',          flag:'🇨🇱', lat:-35.6751, lon:-71.543, color:'#8B2BE2' },
  { id:'colombia',   name:'Colombie',       flag:'🇨🇴', lat:4.7,   lon:-74.1, color:'#8B2BE2' },
  { id:'peru',       name:'Pérou',          flag:'🇵🇪', lat:-9.2,  lon:-75.0, color:'#8B2BE2' },
  { id:'venezuela',  name:'Venezuela',      flag:'🇻🇪', lat:6.4,   lon:-66.6, color:'#8B2BE2' },
  { id:'costarica',  name:'Costa Rica',     flag:'🇨🇷', lat:9.7489,  lon:-83.7534, color:'#8B2BE2' },
  { id:'guatemala',  name:'Guatemala',      flag:'🇬🇹', lat:15.8,  lon:-90.2, color:'#8B2BE2' },
  { id:'paraguay',   name:'Paraguay',       flag:'🇵🇾', lat:-23.4, lon:-58.4, color:'#8B2BE2' },
  { id:'jamaica',    name:'Jamaïque',       flag:'🇯🇲', lat:18.1,  lon:-77.3, color:'#8B2BE2' },
  { id:'aruba',      name:'Aruba',          flag:'🇦🇼', lat:12.5,  lon:-69.9, color:'#8B2BE2' },
  { id:'barbados',   name:'Barbade',        flag:'🇧🇧', lat:13.2,  lon:-59.6, color:'#8B2BE2' },
  { id:'stkitts',    name:'St-Kitts',       flag:'🇰🇳', lat:17.3,  lon:-62.7, color:'#8B2BE2' },
  { id:'stmartin',   name:'Saint-Martin',   flag:'🇸🇽', lat:18.1,  lon:-63.1, color:'#8B2BE2' },
  { id:'caymanisles',name:'Îles Caïmans',   flag:'🇰🇾', lat:19.3,  lon:-81.4, color:'#8B2BE2' },
  // Océanie
  { id:'australia',  name:'Australie',      flag:'🇦🇺', lat:-25.3, lon:133.8, color:'#8B2BE2' },

  // Pays ajoutés
  { id:'cuba', name:"Cuba", flag:'🇨🇺', lat:21.5218, lon:-77.7812, color:'#8B2BE2' },
  { id:'brazil', name:"Brésil", flag:'🇧🇷', lat:-14.235, lon:-51.9253, color:'#8B2BE2' },
  { id:'mexico', name:"Mexique", flag:'🇲🇽', lat:23.6345, lon:-102.5528, color:'#8B2BE2' },
  { id:'nicaragua', name:"Nicaragua", flag:'🇳🇮', lat:12.8, lon:-85.2, color:'#8B2BE2' },
  { id:'dominican', name:"Rép. Dominicaine", flag:'🇩🇴', lat:18.7, lon:-70.2, color:'#8B2BE2' },
  { id:'honduras', name:"Honduras", flag:'🇭🇳', lat:15.2, lon:-86.2, color:'#8B2BE2' },
  { id:'ecuador', name:"Équateur", flag:'🇪🇨', lat:-1.5, lon:-78.5, color:'#8B2BE2' },
  { id:'indonesia', name:"Indonésie", flag:'🇮🇩', lat:-0.7893, lon:113.9213, color:'#8B2BE2' },
  { id:'philippines', name:"Philippines", flag:'🇵🇭', lat:12.8797, lon:121.774, color:'#8B2BE2' },
  { id:'panama', name:"Panama", flag:'🇵🇦', lat:8.5, lon:-80.8, color:'#8B2BE2' },
  { id:'cameroon', name:"Cameroun", flag:'🇨🇲', lat:3.848, lon:11.5021, color:'#8B2BE2' },
  { id:'usa', name:"États-Unis", flag:'🇺🇸', lat:37.0902, lon:-95.7129, color:'#8B2BE2' },
  { id:'monaco', name:"Monaco", flag:'🇲🇨', lat:43.7384, lon:7.4246, color:'#8B2BE2' },
];

// Données établissements — chargées depuis l'API au clic (data.php)
var LOUNGES = (typeof LOUNGES !== 'undefined') ? LOUNGES : {};




