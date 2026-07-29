/* globe.js */
// globe.js — Globe state, rendering engine, world map loader
// ════════════════════════════════════════════════════════

// ── Canvas refs ──────────────────────────────────────────
var globe = document.getElementById('globe');
var gc    = globe.getContext('2d');
var tip   = document.getElementById('tip');

// ── State — var so all files can read/write ───────────────
var W, H, R;
// Géré par CG.state
rotX = 0.3; rotY = 0; targetX = 0.3; targetY = 0;
// Géré par CG.state
drag = false; lastX = 0; lastY = 0;
// Géré par CG.state
autoRot = true;
var selCountry = null, hoverCountry = null;
var showMarkets = false, selMarket = null, hoverMarket = null;
var showLounges = true, selLoungeCountry = null, hoverLoungeCountry = null;  // visible by default
var zoomScale = 1;
// Géré par CG.state
animating = false; animStartTime = 0; animDuration = 1200;
var animFromX = 0, animFromY = 0, animToX = 0, animToY = 0;

// ── Accessibilité : respect de prefers-reduced-motion ────
// Fige la rotation auto et les pulsations des marqueurs pour les
// utilisateurs qui demandent moins d'animations.
var _reduceMotion = false;
try {
  var _rmMq = window.matchMedia('(prefers-reduced-motion: reduce)');
  _reduceMotion = _rmMq.matches;
  (_rmMq.addEventListener ? _rmMq.addEventListener.bind(_rmMq,'change')
                          : _rmMq.addListener.bind(_rmMq))(function(e){ _reduceMotion = e.matches; });
} catch(e){}
// Horloge d'animation : figée (valeur stable) si reduced-motion.
function animNow(){ return _reduceMotion ? 0 : Date.now(); }

// ── Inertie du drag (momentum au relâché) ────────────────
var velX = 0, velY = 0, _inertia = false, _lastMoveT = 0;

function easeInOut(t){ return t<.5 ? 2*t*t : 1-Math.pow(-2*t+2,2)/2; }

// ── Canvas resize — DPR avec compatibilité Safari iOS ────────────
var DPR = 1;
var _isSafari = /^((?!chrome|android).)*safari/i.test(navigator.userAgent);

function resize(){
  W = window.innerWidth;
  H = window.innerHeight;
  // Safari iOS : limiter à 2x max (évite les artefacts de rendu)
  DPR = _isSafari
    ? Math.min(window.devicePixelRatio || 1, 2)
    : Math.min(window.devicePixelRatio || 1, 2.5);

  // Taille physique du canvas (pixels réels)
  globe.width  = Math.round(W * DPR);
  globe.height = Math.round(H * DPR);
  // Taille CSS (inchangée — évite le flou)
  globe.style.width  = W + 'px';
  globe.style.height = H + 'px';
  // Safari : ne pas utiliser setTransform — scale() après clearRect est plus stable
  // Le scale est appliqué dans drawGlobe() à chaque frame
}
resize();
window.addEventListener('resize', resize);

function getR(){
  // Sur mobile (écran étroit) on agrandit légèrement le globe
  var base = W < 500 ? 0.40 : 0.34;
  return Math.min(W,H) * base * zoomScale;
}

// ── 3D math ──────────────────────────────────────────────
function ll2xyz(lat, lon, r){
  var phi = (90-lat)*Math.PI/180, th = (lon+180)*Math.PI/180;
  return { x:-r*Math.sin(phi)*Math.cos(th), y:r*Math.cos(phi), z:r*Math.sin(phi)*Math.sin(th) };
}
function proj(x, y, z){
  var cx = Math.cos(rotX), sx = Math.sin(rotX);
  var cy = Math.cos(rotY), sy = Math.sin(rotY);
  var y1 =  y*cx - z*sx;
  var z1 =  y*sx + z*cx;
  var x2 =  x*cy + z1*sy;
  var z2 = -x*sy + z1*cy;
  return { x: W/2+x2, y: H/2-y1, z: z2 };
}

// ── Theme colours ────────────────────────────────────────
// Mise en cache : getComputedStyle est coûteux et était appelé à chaque
// frame (×3+). On ne recalcule qu'au changement de thème (invalidateThemeColors).
var _tcCache = null;
function invalidateThemeColors(){ _tcCache = null; if (typeof _ovl !== 'undefined' && _ovl) _ovl.key = ''; }
function getThemeColors(){
  if (_tcCache) return _tcCache;
  var s = getComputedStyle(document.documentElement);
  function g(v){ return s.getPropertyValue(v).trim(); }
  _tcCache = {
    bg:g('--bg'), bg2:g('--bg2'), bg3:g('--bg3'),
    oceanA:g('--ocean-a'), oceanB:g('--ocean-b'), oceanC:g('--ocean-c'), oceanD:g('--ocean-d'),
    globeA:g('--globe-a'), globeB:g('--globe-b'), globeC:g('--globe-c'), globeD:g('--globe-d'),
    spec1:g('--spec1'), spec2:g('--spec2'), rim:g('--rim'),
    grid:g('--grid'), equator:g('--equator'),
    worldFill:g('--world-fill'), worldStroke:g('--world-stroke'),
    zoneLabel:g('--zone-label'), zoneHalo:g('--zone-halo'),
    gold:g('--gold'), goldL:g('--gold-l'), ember:g('--ember'), grn:g('--grn'),
    limb:g('--limb'), shade:g('--shade'), grain:parseFloat(g('--grain')) || 0,
    oceanLabel:g('--ocean-label'),
  };
  return _tcCache;
}

// ── Ombrage de sphère : limbe + directionnel + grain ─────
// Ces trois couches ne dépendent que du rayon et du thème — jamais de la
// rotation. On les peint une fois dans un canvas hors écran, puis chaque
// image ne coûte plus qu'un seul drawImage.
var _ovl = { key: '', cv: null };
var _grainCv = null;

function grainTile(){
  if (_grainCv) return _grainCv;
  var n = 96, cv = document.createElement('canvas');
  cv.width = cv.height = n;
  var x = cv.getContext('2d');
  var img = x.createImageData(n, n), d = img.data;
  for (var i = 0; i < d.length; i += 4){
    // Gris moyen bruité : neutre en fusion « overlay », il n'éclaircit ni
    // n'assombrit l'ensemble — il n'ajoute que de la matière.
    var v = 110 + Math.random() * 36;
    d[i] = d[i+1] = d[i+2] = v; d[i+3] = 255;
  }
  x.putImageData(img, 0, 0);
  _grainCv = cv;
  return cv;
}

function sphereOverlay(tc, R){
  var key = Math.round(R) + '|' + tc.limb + '|' + tc.shade + '|' + tc.grain + '|' + DPR;
  if (_ovl.key === key) return _ovl.cv;

  var d  = Math.max(2, Math.ceil(R * 2));
  var cv = document.createElement('canvas');
  cv.width = cv.height = Math.ceil(d * DPR);
  var x = cv.getContext('2d');
  x.scale(DPR, DPR);

  var c = d / 2, r = d / 2;
  x.beginPath(); x.arc(c, c, r, 0, Math.PI * 2); x.clip();

  // Ombrage directionnel — contrepoint sombre au reflet (en haut à gauche)
  var lx = c - r * 0.34, ly = c - r * 0.34;
  var dg = x.createRadialGradient(lx, ly, r * 0.10, lx, ly, r * 1.9);
  dg.addColorStop(0,   'rgba(0,0,0,0)');
  dg.addColorStop(0.5, 'rgba(0,0,0,0)');
  dg.addColorStop(1,   tc.shade || 'rgba(0,0,0,0)');
  x.fillStyle = dg; x.fillRect(0, 0, d, d);

  // Assombrissement du limbe — le signal de sphéricité
  var lg = x.createRadialGradient(c, c, r * 0.60, c, c, r);
  lg.addColorStop(0, 'rgba(0,0,0,0)');
  lg.addColorStop(1, tc.limb || 'rgba(0,0,0,0)');
  x.fillStyle = lg; x.fillRect(0, 0, d, d);

  // Grain — matière de papier imprimé
  if (tc.grain > 0.001){
    x.globalCompositeOperation = 'overlay';
    x.globalAlpha = tc.grain;
    x.fillStyle = x.createPattern(grainTile(), 'repeat');
    x.fillRect(0, 0, d, d);
    x.globalAlpha = 1;
    x.globalCompositeOperation = 'source-over';
  }

  _ovl = { key: key, cv: cv };
  return cv;
}

// ── Étiquettes des océans ────────────────────────────────
// Typographie d'atlas : italique, lettres espacées, encre discrète.
// Les mers n'apparaissent qu'au zoom (minZoom) pour ne pas encombrer la
// vue d'ensemble. Traduites dans les 6 langues du site.
var OCEANS = [
  { lat:  30, lon: -155, minZoom: 0,   n: { fr:'Océan Pacifique Nord', en:'North Pacific Ocean', es:'Océano Pacífico Norte', de:'Nordpazifik',        zh:'北太平洋', ar:'المحيط الهادئ الشمالي' } },
  { lat: -25, lon: -125, minZoom: 0,   n: { fr:'Océan Pacifique Sud',  en:'South Pacific Ocean', es:'Océano Pacífico Sur',   de:'Südpazifik',         zh:'南太平洋', ar:'المحيط الهادئ الجنوبي' } },
  { lat:  32, lon:  -42, minZoom: 0,   n: { fr:'Océan Atlantique',     en:'North Atlantic Ocean',es:'Océano Atlántico',      de:'Nordatlantik',       zh:'北大西洋', ar:'المحيط الأطلسي' } },
  { lat: -26, lon:  -18, minZoom: 0,   n: { fr:'Atlantique Sud',       en:'South Atlantic Ocean',es:'Atlántico Sur',         de:'Südatlantik',        zh:'南大西洋', ar:'الأطلسي الجنوبي' } },
  { lat: -22, lon:   78, minZoom: 0,   n: { fr:'Océan Indien',         en:'Indian Ocean',        es:'Océano Índico',         de:'Indischer Ozean',    zh:'印度洋',   ar:'المحيط الهندي' } },
  { lat: -60, lon:   35, minZoom: 1.1, n: { fr:'Océan Austral',        en:'Southern Ocean',      es:'Océano Austral',        de:'Südlicher Ozean',    zh:'南大洋',   ar:'المحيط الجنوبي' } },
  { lat:  80, lon:  -20, minZoom: 1.1, n: { fr:'Océan Arctique',       en:'Arctic Ocean',        es:'Océano Ártico',         de:'Arktischer Ozean',   zh:'北冰洋',   ar:'المحيط المتجمد' } },
  // Mers d'intérêt pour l'atlas du cigare
  { lat:  14, lon:  -76, minZoom: 1.7, n: { fr:'Mer des Caraïbes',     en:'Caribbean Sea',       es:'Mar Caribe',            de:'Karibisches Meer',   zh:'加勒比海', ar:'البحر الكاريبي' } },
  { lat:  35, lon:   17, minZoom: 1.5, n: { fr:'Méditerranée',         en:'Mediterranean Sea',   es:'Mediterráneo',          de:'Mittelmeer',         zh:'地中海',   ar:'البحر المتوسط' } },
  { lat:  25, lon:  -90, minZoom: 1.8, n: { fr:'Golfe du Mexique',     en:'Gulf of Mexico',      es:'Golfo de México',       de:'Golf von Mexiko',    zh:'墨西哥湾', ar:'خليج المكسيك' } },
];

function drawOceanLabels(tc, R){
  var lang = window.currentLang || 'fr';
  var size = Math.max(9, Math.min(15, R * 0.042));

  gc.save();
  gc.font = 'italic ' + size.toFixed(1) + 'px Georgia, "Times New Roman", serif';
  gc.textAlign = 'center';
  gc.textBaseline = 'middle';
  gc.lineJoin = 'round';
  // L'espacement des lettres n'est pas gere partout : on l'applique si
  // le navigateur le propose, sinon le rendu reste correct sans.
  if ('letterSpacing' in gc) gc.letterSpacing = Math.round(size * 0.18) + 'px';

  OCEANS.forEach(function(o){
    if (zoomScale < o.minZoom) return;
    var p  = ll2xyz(o.lat, o.lon, R);
    var pj = proj(p.x, p.y, p.z);
    var fade = limbFade(pj.z, R);
    if (fade < 0.45) return;                 // trop pres du bord : illisible

    var label = o.n[lang] || o.n.fr;
    gc.globalAlpha = fade;
    gc.strokeStyle = tc.zoneHalo;            // halo : lisibilite sur la mer
    gc.lineWidth = 2.5;
    gc.strokeText(label, pj.x, pj.y);
    gc.fillStyle = tc.oceanLabel;
    gc.fillText(label, pj.x, pj.y);
  });

  gc.globalAlpha = 1;
  if ('letterSpacing' in gc) gc.letterSpacing = '0px';
  gc.restore();
}

// ── World map (TopoJSON) ──────────────────────────────────
var worldFeatures = null;
function drawWorldCountries(tc){
  if(!worldFeatures) return;
  worldFeatures.forEach(function(f){
    if(!f.geometry) return;
    var geoms = f.geometry.type==='MultiPolygon'
      ? f.geometry.coordinates
      : [f.geometry.coordinates];
    geoms.forEach(function(poly){
      poly.forEach(function(ring){
        gc.beginPath();
        var first = true, hasPoints = false;
        ring.forEach(function(pt){
          var p = ll2xyz(pt[1], pt[0], getR());
          var pj = proj(p.x, p.y, p.z);
          if(pj.z < 0){ first=true; return; }
          first ? gc.moveTo(pj.x,pj.y) : gc.lineTo(pj.x,pj.y);
          first = false; hasPoints = true;
        });
        if(!hasPoints) return;
        gc.fillStyle = tc.worldFill;
        gc.fill();
        gc.strokeStyle = tc.worldStroke;
        gc.lineWidth = _isSafari ? Math.max(0.5, 0.7/DPR) : Math.max(0.4, 0.6/DPR);
        gc.stroke();
      });
    });
  });
}

// ── Producer country polygons ────────────────────────────
function drawCountryPoly(cid, color, isActive){
  var poly = COUNTRY_POLYS[cid]; if(!poly) return;
  var R = getR();
  gc.save(); gc.beginPath();
  var first = true;
  poly.forEach(function(pt){
    var p = ll2xyz(pt[0], pt[1], R+1);
    var pj = proj(p.x, p.y, p.z);
    if(pj.z < 0){ first=true; return; }
    first ? gc.moveTo(pj.x,pj.y) : gc.lineTo(pj.x,pj.y);
    first = false;
  });
  gc.closePath();
  gc.fillStyle = color + (isActive?'55':'33');
  gc.fill();
  gc.strokeStyle = color;
  gc.lineWidth = isActive ? Math.max(1.5, 2/DPR) : Math.max(0.8, 1/DPR);
  gc.stroke();
  gc.restore();
}

// ── Production zones ─────────────────────────────────────
function drawZones(cid, color){
  var zones = ZONES[cid]; if(!zones) return;
  var R = getR(); var tc = getThemeColors();
  var now = Date.now();
  zones.forEach(function(z){
    var zp = ll2xyz(z.lat, z.lon, R+3);
    var zpj = proj(zp.x, zp.y, zp.z);
    if(zpj.z < 0) return;
    var pulse = Math.sin(now*.002 + z.lat*.5) * .5 + .5;
    var gr = gc.createRadialGradient(zpj.x,zpj.y,0,zpj.x,zpj.y,10+pulse*5);
    gr.addColorStop(0, color+'CC'); gr.addColorStop(1, color+'00');
    gc.beginPath(); gc.arc(zpj.x,zpj.y,10+pulse*5,0,Math.PI*2);
    gc.fillStyle=gr; gc.fill();
    gc.beginPath(); gc.arc(zpj.x,zpj.y,4,0,Math.PI*2);
    gc.fillStyle=color; gc.fill();
    // Label
    gc.save();
    gc.font='700 9px Cinzel,serif';
    var tx=zpj.x+8, ty=zpj.y+3;
    gc.strokeStyle=tc.zoneHalo; gc.lineWidth=3; gc.lineJoin='round';
    gc.strokeText(z.name,tx,ty);
    gc.fillStyle=tc.zoneLabel; gc.fillText(z.name,tx,ty);
    gc.restore();
  });
}

// ── Consumer market markers (blue diamonds) ──────────────
function drawMarkets(){
  if(!showMarkets) return;
  var R = getR(); var now = animNow(); var tc = getThemeColors();
  MARKETS.forEach(function(m){
    var p = ll2xyz(m.lat, m.lon, R);
    var pj = proj(p.x, p.y, p.z);
    var fade = limbFade(pj.z, R);
    if(fade <= 0) return;
    gc.globalAlpha = fade;
    var isSel = selMarket && selMarket.id===m.id;
    var isHov = hoverMarket && hoverMarket.id===m.id;
    var pulse = Math.sin(now*.0018+m.lat*.4)*.5+.5;
    var size = isSel?11:isHov?9:7;
    // Glow
    var glowR = 18+pulse*8+(isSel?10:0)+(isHov?5:0);
    var grd = gc.createRadialGradient(pj.x,pj.y,4,pj.x,pj.y,glowR);
    grd.addColorStop(0,'rgba(26,107,181,0.35)'); grd.addColorStop(1,'rgba(26,107,181,0)');
    gc.beginPath(); gc.arc(pj.x,pj.y,glowR,0,Math.PI*2);
    gc.fillStyle=grd; gc.fill();
    // Pulse ring
    gc.beginPath(); gc.arc(pj.x,pj.y,12+pulse*6,0,Math.PI*2);
    gc.strokeStyle='rgba(26,107,181,'+(0.15+pulse*0.12)+')';
    gc.lineWidth=1; gc.stroke();
    // Diamond
    gc.save(); gc.translate(pj.x,pj.y); gc.rotate(Math.PI/4);
    var dg = gc.createLinearGradient(-size,-size,size,size);
    dg.addColorStop(0,'#5AACF0'); dg.addColorStop(0.5,'#1A6BB5'); dg.addColorStop(1,'#0D3F80');
    gc.beginPath(); gc.rect(-size,-size,size*2,size*2);
    gc.fillStyle=dg; gc.fill();
    gc.strokeStyle='rgba(255,255,255,0.7)'; gc.lineWidth=1.5; gc.stroke();
    gc.restore();
    // Rank
    gc.save(); gc.font='bold 8px Lato,sans-serif';
    gc.fillStyle='#FFF'; gc.textAlign='center'; gc.textBaseline='middle';
    gc.fillText('#'+m.rank, pj.x, pj.y);
    gc.restore();
    // Label
    if(isSel||isHov||m.rank<=5){
      var lbl = m.name.toUpperCase();
      gc.save(); gc.font='600 9px Cinzel,serif';
      var tx=pj.x+size+10, ty=pj.y+4;
      gc.strokeStyle=tc.zoneHalo; gc.lineWidth=3; gc.lineJoin='round';
      gc.strokeText(lbl,tx,ty); gc.fillStyle='#1A6BB5'; gc.fillText(lbl,tx,ty);
      gc.restore();
    }
    if(isSel){
      gc.beginPath(); gc.arc(pj.x,pj.y,size+6,0,Math.PI*2);
      gc.strokeStyle='#1A6BB5'; gc.lineWidth=2; gc.stroke();
    }
    gc.globalAlpha = 1;
  });
}

// ── Lounge country markers (purple triangles ▲) ──────────
function drawLoungeCountries(){
  if(!showLounges) return;
  if(typeof LOUNGE_COUNTRIES === 'undefined') return;
  var R = getR(); var now = animNow(); var tc = getThemeColors();

  // Construire la liste des pays lounge UNIQUEMENT non-producteurs
  // Les pays producteurs (COUNTRIES) ont déjà leur propre marqueur visuel distinctif
  var producerIds = {};
  if(typeof COUNTRIES !== 'undefined') {
    COUNTRIES.forEach(function(c){ producerIds[c.id] = true; });
  }

  // Non-producteurs : triangle violet standard
  var allLounge = LOUNGE_COUNTRIES.filter(function(lc){ return !producerIds[lc.id]; });

  // Producteurs avec lounges : petite pastille violette offset
  if(typeof COUNTRIES !== 'undefined' && typeof LOUNGES !== 'undefined') {
    COUNTRIES.forEach(function(c){
      if(!LOUNGES[c.id] || !LOUNGES[c.id].length) return;
      var p  = ll2xyz(c.lat, c.lon, R);
      var pj = proj(p.x, p.y, p.z);
      if(pj.z < -10) return;
      // Petite pastille violette en bas-droite du dot producteur
      var offset = 12;
      gc.beginPath();
      gc.arc(pj.x + offset, pj.y + offset, 4, 0, Math.PI*2);
      gc.fillStyle = '#9B3BFF';
      gc.fill();
      gc.strokeStyle = 'rgba(255,255,255,0.8)';
      gc.lineWidth = 1;
      gc.stroke();
    });
  }

  allLounge.forEach(function(lc){
    var p  = ll2xyz(lc.lat, lc.lon, R);
    var pj = proj(p.x, p.y, p.z);
    var fade = limbFade(pj.z, R);
    if(fade <= 0) return;
    gc.globalAlpha = fade;

    var isSel = selLoungeCountry && selLoungeCountry.id === lc.id;
    var isHov = hoverLoungeCountry && hoverLoungeCountry.id === lc.id;
    var pulse = Math.sin(now * .0014 + lc.lat * .3) * .5 + .5;
    var size  = isSel ? 11 : isHov ? 9 : 7;   // bigger - more visible
    var h     = size * 1.8;

    // Outer glow
    var glowR = 18 + pulse*8 + (isSel?10:0) + (isHov?5:0);
    var grd = gc.createRadialGradient(pj.x, pj.y, 1, pj.x, pj.y, glowR);
    grd.addColorStop(0, 'rgba(139,43,226,0.28)');
    grd.addColorStop(1, 'rgba(139,43,226,0)');
    gc.beginPath(); gc.arc(pj.x, pj.y, glowR, 0, Math.PI*2);
    gc.fillStyle = grd; gc.fill();

    // Pulsing ring
    gc.beginPath(); gc.arc(pj.x, pj.y, 9+pulse*5, 0, Math.PI*2);
    gc.strokeStyle = 'rgba(139,43,226,' + (0.12+pulse*0.1) + ')';
    gc.lineWidth = 1; gc.stroke();

    // Triangle ▲
    gc.save();
    gc.translate(pj.x, pj.y);
    gc.beginPath();
    gc.moveTo(0, -h);
    gc.lineTo( size, h*0.55);
    gc.lineTo(-size, h*0.55);
    gc.closePath();
    var tg = gc.createLinearGradient(0, -h, 0, h*0.55);
    tg.addColorStop(0, '#D070FF');
    tg.addColorStop(1, '#7B2FBE');
    gc.fillStyle = tg;
    gc.fill();
    gc.strokeStyle = 'rgba(255,255,255,0.8)';
    gc.lineWidth = 1;
    gc.stroke();
    gc.restore();

    // Country name label on hover / selection
    if(isSel || isHov){
      var lbl = lc.name.toUpperCase();
      gc.save();
      gc.font = 'bold 9px Cinzel,serif';
      var tx = pj.x + size + 9, ty = pj.y + 3;
      gc.strokeStyle = tc.zoneHalo; gc.lineWidth = 3; gc.lineJoin = 'round';
      gc.strokeText(lbl, tx, ty);
      gc.fillStyle = '#9B3BFF';
      gc.fillText(lbl, tx, ty);
      gc.restore();
    }

    // Selected ring
    if(isSel){
      gc.beginPath(); gc.arc(pj.x, pj.y, size+5, 0, Math.PI*2);
      gc.strokeStyle = '#C060FF'; gc.lineWidth = 2; gc.stroke();
    }
    gc.globalAlpha = 1;
  });
}

// ── Main globe render ────────────────────────────────────
// Opacité d'un marqueur selon sa profondeur : plein sur la face avant,
// fondu progressif à l'approche du limbe (bord du globe), 0 derrière.
function limbFade(z, R){
  var start = R * 0.12, end = -R * 0.03;
  if (z <= end)   return 0;
  if (z >= start) return 1;
  return (z - end) / (start - end);
}

// Étiquette lisible sur le globe (texte + halo), aux couleurs du thème.
function drawGlobeLabel(text, x, y, strong, tc){
  gc.save();
  gc.font = (strong ? 'bold 12px' : '11px') + " Georgia, serif";
  gc.textAlign = 'center';
  gc.textBaseline = 'top';
  gc.lineJoin = 'round';
  gc.lineWidth = 3.5;
  gc.strokeStyle = tc.zoneHalo || 'rgba(255,255,255,0.92)';
  gc.strokeText(text, x, y);
  gc.fillStyle = tc.zoneLabel || '#2A1F14';
  gc.fillText(text, x, y);
  gc.restore();
}

function drawGlobe(){
  var tc = getThemeColors();
  // Appliquer le scale DPR à chaque frame — plus fiable sur Safari iOS
  gc.setTransform(DPR, 0, 0, DPR, 0, 0);
  gc.imageSmoothingEnabled = true;
  gc.clearRect(0, 0, W, H);

  var R = getR();

  // Halo d'atmosphère (glow externe) — dessiné avant la sphère (opaque)
  // qui recouvre la partie interne, ne laissant que l'anneau lumineux.
  var haloR = R * 1.13;
  var haGrd = gc.createRadialGradient(W/2, H/2, R*0.94, W/2, H/2, haloR);
  haGrd.addColorStop(0,    'rgba(130,190,235,0.30)');
  haGrd.addColorStop(0.45, 'rgba(130,190,235,0.10)');
  haGrd.addColorStop(1,    'rgba(130,190,235,0)');
  gc.beginPath(); gc.arc(W/2, H/2, haloR, 0, Math.PI*2);
  gc.fillStyle = haGrd; gc.fill();

  // Ocean sphere
  var oGrd = gc.createRadialGradient(W/2-R*.25, H/2-R*.2, R*.1, W/2, H/2, R);
  oGrd.addColorStop(0, tc.oceanA); oGrd.addColorStop(0.4, tc.oceanB);
  oGrd.addColorStop(0.75, tc.oceanC); oGrd.addColorStop(1, tc.oceanD);
  gc.beginPath(); gc.arc(W/2, H/2, R, 0, Math.PI*2);
  gc.fillStyle = oGrd; gc.fill();

  // World countries (TopoJSON)
  drawWorldCountries(tc);

  // Grid
  for(var lat=-80; lat<=80; lat+=20){
    gc.beginPath(); var f=true;
    for(var lon=-180; lon<=180; lon+=3){
      var p=ll2xyz(lat,lon,R), pj=proj(p.x,p.y,p.z);
      if(pj.z<0){f=true;continue;}
      f ? gc.moveTo(pj.x,pj.y) : gc.lineTo(pj.x,pj.y); f=false;
    }
    gc.strokeStyle=tc.grid; gc.lineWidth=Math.max(0.3, 0.5/DPR); gc.stroke();
  }
  for(var lon2=-180; lon2<180; lon2+=20){
    gc.beginPath(); var f2=true;
    for(var lat2=-90; lat2<=90; lat2+=3){
      var p2=ll2xyz(lat2,lon2,R), pj2=proj(p2.x,p2.y,p2.z);
      if(pj2.z<0){f2=true;continue;}
      f2 ? gc.moveTo(pj2.x,pj2.y) : gc.lineTo(pj2.x,pj2.y); f2=false;
    }
    gc.strokeStyle=tc.grid; gc.lineWidth=Math.max(0.2, 0.4/DPR); gc.stroke();
  }
  // Equator
  gc.beginPath(); var fe=true;
  for(var lonE=-180; lonE<=180; lonE+=2){
    var pe=ll2xyz(0,lonE,R), pje=proj(pe.x,pe.y,pe.z);
    if(pje.z<0){fe=true;continue;}
    fe ? gc.moveTo(pje.x,pje.y) : gc.lineTo(pje.x,pje.y); fe=false;
  }
  gc.strokeStyle=tc.equator; gc.lineWidth=0.8; gc.stroke();

  // Étiquettes des océans — sous l'ombrage, comme une encre sur la carte
  drawOceanLabels(tc, R);

  // Ombrage de sphère : limbe + directionnel + grain (couche pré-calculée)
  gc.drawImage(sphereOverlay(tc, R), W/2 - R, H/2 - R, R*2, R*2);

  // Globe shadow
  gc.save();
  gc.shadowColor='rgba(0,0,0,0.20)'; gc.shadowBlur=32;
  gc.shadowOffsetX=R*.05; gc.shadowOffsetY=R*.08;
  gc.beginPath(); gc.arc(W/2, H/2, R*.98, 0, Math.PI*2);
  gc.fillStyle='rgba(0,0,0,0.001)'; gc.fill();
  gc.shadowColor='transparent'; gc.restore();

  // Specular highlight
  var sGrd=gc.createRadialGradient(W/2-R*.3,H/2-R*.3,0,W/2-R*.1,H/2-R*.1,R*.6);
  sGrd.addColorStop(0,tc.spec1); sGrd.addColorStop(0.5,tc.spec2); sGrd.addColorStop(1,'transparent');
  gc.beginPath(); gc.arc(W/2,H/2,R,0,Math.PI*2);
  gc.fillStyle=sGrd; gc.fill();

  // Rim
  var rimGrd=gc.createRadialGradient(W/2,H/2,R*.88,W/2,H/2,R);
  rimGrd.addColorStop(0,'transparent'); rimGrd.addColorStop(1,tc.rim);
  gc.beginPath(); gc.arc(W/2,H/2,R,0,Math.PI*2);
  gc.fillStyle=rimGrd; gc.fill();

  // Globe border
  gc.beginPath(); gc.arc(W/2,H/2,R,0,Math.PI*2);
  gc.strokeStyle=tc.rim; gc.lineWidth=1; gc.stroke();

  // Producer country polygons + dots
  COUNTRIES.forEach(function(c){
    var isActive = selCountry && selCountry.id===c.id;
    drawCountryPoly(c.id, c.color, isActive);
  });
  COUNTRIES.forEach(function(c){
    var p=ll2xyz(c.lat,c.lon,R), pj=proj(p.x,p.y,p.z);
    var fade=limbFade(pj.z,R);
    if(fade<=0) return;
    gc.globalAlpha=fade;
    var isActive=selCountry&&selCountry.id===c.id;
    var isHov=hoverCountry&&hoverCountry.id===c.id;
    var now2=animNow();
    var pulse2=Math.sin(now2*.002+c.lat*.5)*.5+.5;
    var size2=isActive?14:isHov?11:8;
    var glowR2=20+pulse2*10+(isActive?12:0);
    var grd2=gc.createRadialGradient(pj.x,pj.y,3,pj.x,pj.y,glowR2);
    grd2.addColorStop(0,c.color+'55'); grd2.addColorStop(1,c.color+'00');
    gc.beginPath(); gc.arc(pj.x,pj.y,glowR2,0,Math.PI*2);
    gc.fillStyle=grd2; gc.fill();
    gc.beginPath(); gc.arc(pj.x,pj.y,size2,0,Math.PI*2);
    var dg2=gc.createRadialGradient(pj.x-size2*.3,pj.y-size2*.3,0,pj.x,pj.y,size2);
    dg2.addColorStop(0,'#fff9'); dg2.addColorStop(0.3,c.color); dg2.addColorStop(1,c.color+'aa');
    gc.fillStyle=dg2; gc.fill();
    gc.strokeStyle='rgba(255,255,255,0.6)'; gc.lineWidth=1; gc.stroke();
    if(isActive) drawZones(c.id, c.color);
    // Flag emoji
    if(isActive||isHov){
      gc.save(); gc.font=(isActive?'18px':'14px')+' serif';
      gc.textAlign='center'; gc.textBaseline='middle';
      gc.fillText(c.flag, pj.x, pj.y);
      gc.restore();
    }
    // Étiquette du pays : au survol/sélection, ou dès qu'on zoome (>1.4×)
    if(isActive||isHov||zoomScale>1.4){
      drawGlobeLabel(c.name, pj.x, pj.y + size2 + 5, isActive, tc);
    }
    gc.globalAlpha=1;
  });

  // Market diamonds (on top)
  drawMarkets();

  // Lounge country triangles (on top of everything)
  drawLoungeCountries();
}

// ════════════════════════════════════════════════════════
// GYROSCOPE — Device orientation + bouton toggle mobile
// ════════════════════════════════════════════════════════
var _gyroActive   = false;
var _gyroEnabled  = false;
var _betaRef      = null;  // référence neutre (position initiale)
var _gammaRef     = null;

function startGyro() {
  if (_gyroEnabled) return;
  _gyroEnabled = true;
  _betaRef = null; _gammaRef = null;  // reset référence

  window.addEventListener('deviceorientation', function(e) {
    if (!_gyroActive || drag || animating) return;
    if (!e.beta && !e.gamma) return;

    // Calibration : mémoriser la position tenue au 1er événement
    if (_betaRef === null) { _betaRef = e.beta; _gammaRef = e.gamma; return; }

    var sensitivity = 0.012;
    var dBeta  = (e.beta  - _betaRef)  * sensitivity;
    var dGamma = (e.gamma - _gammaRef) * sensitivity;

    // Clamp pour éviter les retournements
    var newX = Math.max(-Math.PI/2, Math.min(Math.PI/2, rotX + dBeta  * 0.08));
    var newY = rotY + dGamma * 0.08;

    targetX = newX;
    targetY = newY;
  }, { passive: true });
}

function toggleGyro() {
  var btn = document.getElementById('gyro-btn');
  if (!btn) return;

  // iOS 13+ : demander la permission au premier tap
  if (typeof DeviceOrientationEvent !== 'undefined' &&
      typeof DeviceOrientationEvent.requestPermission === 'function') {
    DeviceOrientationEvent.requestPermission()
      .then(function(state) {
        if (state === 'granted') {
          startGyro();
          _gyroActive = !_gyroActive;
          _betaRef = null; _gammaRef = null; // recalibrer
          _updateGyroBtn(btn);
        } else {
          btn.textContent = '🚫';
          btn.title = 'Permission gyroscope refusée';
          setTimeout(function(){ btn.textContent = '🔄'; }, 2000);
        }
      })
      .catch(function() {
        btn.textContent = '⚠';
        setTimeout(function(){ _updateGyroBtn(btn); }, 2000);
      });
  } else {
    // Android / non-iOS : pas besoin de permission
    startGyro();
    _gyroActive = !_gyroActive;
    _betaRef = null; _gammaRef = null;
    _updateGyroBtn(btn);
  }
  if (_gyroActive) autoRot = false;
}

function _updateGyroBtn(btn) {
  btn.classList.toggle('gyro-on', _gyroActive);
  btn.title = _gyroActive ? 'Gyroscope actif — tap pour désactiver' : 'Activer le gyroscope';
}

// Injecter le bouton gyroscope dans le DOM au chargement
window.addEventListener('DOMContentLoaded', function() {
  // Seulement sur mobile/tactile
  if (!('ontouchstart' in window) && !navigator.maxTouchPoints) return;
  if (typeof DeviceOrientationEvent === 'undefined') return;

  var btn = document.createElement('button');
  btn.id        = 'gyro-btn';
  btn.innerHTML = '🔄';
  btn.title     = 'Activer le gyroscope';
  btn.setAttribute('aria-label', 'Gyroscope');
  btn.setAttribute('aria-pressed', 'false');
  // Position : au-dessus du bouton ✏ contrib (left, bas)
  var isMob = window.innerWidth <= 640;
  btn.style.cssText = [
    'position:fixed',
    isMob ? 'bottom:110px' : 'bottom:108px',  // au-dessus du contrib-btn
    isMob ? 'left:12px'    : 'left:16px',     // aligné avec contrib-btn
    'right:auto',
    'z-index:200',
    'width:' + (isMob ? '34px' : '38px'),
    'height:' + (isMob ? '34px' : '38px'),
    'border-radius:50%',
    'border:1px solid rgba(201,162,39,0.4)',
    'background:var(--panel-bg, rgba(26,14,0,0.85))',
    'color:#c9a227',
    'font-size:' + (isMob ? '15px' : '17px'),
    'cursor:pointer',
    'display:flex',
    'align-items:center',
    'justify-content:center',
    'backdrop-filter:blur(8px)',
    '-webkit-backdrop-filter:blur(8px)',
    'transition:background .2s, border-color .2s, transform .15s',
    'box-shadow:0 2px 10px rgba(0,0,0,0.4)',
  ].join(';');

  // Style actif
  var style = document.createElement('style');
  style.textContent = '#gyro-btn.gyro-on{background:rgba(201,162,39,0.25)!important;border-color:#c9a227!important;} #gyro-btn.gyro-on::after{content:"";position:absolute;width:8px;height:8px;background:#c9a227;border-radius:50%;bottom:4px;right:4px;}';
  document.head.appendChild(style);

  btn.addEventListener('click', toggleGyro);
  document.body.appendChild(btn);

  // Adapter la position si la fenêtre est redimensionnée
  window.addEventListener('resize', function() {
    var mob = window.innerWidth <= 640;
    btn.style.bottom = mob ? '110px' : '108px';
    btn.style.left   = mob ? '12px'  : '16px';
    btn.style.width  = btn.style.height = mob ? '34px' : '38px';
    btn.style.fontSize = mob ? '15px' : '17px';
  });

  // Android : démarrer directement (pas de permission requise)
  if (typeof DeviceOrientationEvent.requestPermission !== 'function') {
    startGyro();
    // Ne pas activer automatiquement — attendre le tap utilisateur
  }
});




