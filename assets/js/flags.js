/* flags.js *//* flags.js */
// flags.js — World map loader + animated flag renderer

// ════════════════════════════════════════════════════════
// WORLD MAP — Load all countries via Natural Earth TopoJSON
// ════════════════════════════════════════════════════════
// worldFeatures declared in globe.js as var (shared across scripts)

// Cigar country IDs for highlighting (ISO alpha-2 or name matching)
const CIGAR_ISO = new Set(['CU','NI','DO','HN','EC','CM','BR','US','ID','MX','PA','PH']);

async function loadWorldMap() {
  // Ensure topojson library is available (may not have loaded yet in Safari)
  if (typeof topojson === 'undefined') {
    console.warn('TopoJSON not loaded, retrying...');
    setTimeout(loadWorldMap, 500);
    return;
  }
  const loader = document.getElementById('map-loading');
  if(loader){ loader.style.opacity='1'; loader.style.transform='translateX(-50%) translateY(0)'; }
  try {
    // Chemin ANCRE A LA RACINE, pas relatif au document. Depuis les URL
    // par langue (F6), la page vit sous /en/, /es/... et un chemin
    // relatif y designe /en/assets/... — introuvable. index.php ancre
    // deja les href/src du balisage, mais il ne voit pas les fetch
    // ecrits dans un fichier JS : celui-ci lui echappait.
    const resp = await fetch('/assets/data/countries-110m.json');
    // Sans ce controle, la page d'erreur 404 (ErrorDocument -> index.html)
    // etait analysee comme du JSON : l'echec n'apparaissait qu'en
    // avertissement de console, et le globe s'affichait en sphere nue,
    // sans continents ni frontieres, dans les cinq langues.
    if (!resp.ok) throw new Error('HTTP ' + resp.status + ' sur la carte du monde');
    const topo = await resp.json();
    const geo = topojson.feature(topo, topo.objects.countries);
    worldFeatures = geo.features;
    // Les contours des pays producteurs s'appuient dessus : on force la
    // reconstruction de leur index d'appariement.
    if (typeof invalidateFeatureIndex === 'function') invalidateFeatureIndex();
    console.log('World map loaded:', worldFeatures.length, 'countries');
  } catch(e) {
    console.warn('World map load failed:', e);
    worldFeatures = [];
  } finally {
    if(loader){ loader.style.opacity='0'; loader.style.transform='translateX(-50%) translateY(80px)'; }
  }
}
loadWorldMap();

// Project a GeoJSON polygon ring onto the globe canvas
// Returns array of canvas points, splitting when crossing back-hemisphere
function projectGeoRing(ring) {
  const R = getR();
  const segments = [[]];
  for (const [lon, lat] of ring) {
    const p = ll2xyz(lat, lon, R + 0.5);
    const pj = proj(p.x, p.y, p.z);
    if (pj.z < 0) {
      // Behind globe — start new segment
      if (segments[segments.length-1].length > 0) segments.push([]);
    } else {
      segments[segments.length-1].push(pj);
    }
  }
  return segments.filter(s => s.length >= 2);
}

function drawWorldCountries(tc) {
  if (!worldFeatures || worldFeatures.length === 0) return;
  const R = getR();

  // Clip to globe circle
  gc.save();
  gc.beginPath();
  gc.arc(W/2, H/2, R - 1, 0, Math.PI * 2);
  gc.clip();

  for (const feature of worldFeatures) {
    if (!feature.geometry) continue;
    const geom = feature.geometry;
    const rings = [];

    if (geom.type === 'Polygon') {
      rings.push(...geom.coordinates);
    } else if (geom.type === 'MultiPolygon') {
      for (const poly of geom.coordinates) rings.push(...poly);
    }

    for (const ring of rings) {
      const segs = projectGeoRing(ring);
      for (const seg of segs) {
        if (seg.length < 2) continue;
        gc.beginPath();
        gc.moveTo(seg[0].x, seg[0].y);
        for (let i = 1; i < seg.length; i++) gc.lineTo(seg[i].x, seg[i].y);
        gc.fillStyle = tc.worldFill;
        gc.fill();
        gc.strokeStyle = tc.worldStroke;
        gc.lineWidth = 0.4;
        gc.stroke();
      }
    }
  }
  gc.restore();
}

// ════════════════════════════════════════════════════════
// THEME
// ════════════════════════════════════════════════════════
document.querySelectorAll('.theme-btn').forEach(btn=>{
  btn.onclick=()=>{
    const t=btn.dataset.theme;
    document.documentElement.setAttribute('data-theme',t);
    document.querySelectorAll('.theme-btn').forEach(b=>b.classList.toggle('active',b===btn));
  };
});

// ════════════════════════════════════════════════════════
// FLAG RENDERER
// ════════════════════════════════════════════════════════
function drawFlag(cvs,id,t=0){
  const c=cvs.getContext('2d'),W=cvs.width,H=cvs.height;
  c.clearRect(0,0,W,H);
  const w=(x,a=H*.035,f=.016,s=.045)=>Math.sin(x*f-t*s)*a;
  function hStripe(col,y1f,y2f){
    c.fillStyle=col;
    for(let x=0;x<W;x+=2){const wv=w(x);c.fillRect(x,y1f*H+wv,2,(y2f-y1f)*H);}
  }
  function vStripe(col,x1f,x2f){
    c.fillStyle=col;
    // Ondule comme hStripe. Sans cela les drapeaux a bandes VERTICALES
    // (Cameroun, Mexique) restaient parfaitement immobiles tandis que
    // tous les autres flottaient — l'incoherence se voyait d'autant plus
    // que ces deux pays sont des producteurs majeurs.
    // Le rectangle deborde en hauteur : decale par la vague, un rectangle
    // exactement haut de H laisserait une bande transparente au bord.
    const x0=Math.floor(W*x1f), x1=Math.ceil(W*x2f);
    for(let x=x0;x<x1;x+=2){const wv=w(x);c.fillRect(x,wv-H*.06,2,H*1.12);}
  }
  function star5(sx,sy,r,r2,fill){
    c.fillStyle=fill;c.beginPath();
    for(let p=0;p<5;p++){
      const a=p*4*Math.PI/5-Math.PI/2,a2=a+2*Math.PI/5;
      p===0?c.moveTo(sx+Math.cos(a)*r,sy+Math.sin(a)*r):c.lineTo(sx+Math.cos(a)*r,sy+Math.sin(a)*r);
      c.lineTo(sx+Math.cos(a2)*r2,sy+Math.sin(a2)*r2);
    }
    c.closePath();c.fill();
  }
  switch(id){
    case'usa':
      // 13 stripes
      ['#B22234','#FFFFFF','#B22234','#FFFFFF','#B22234','#FFFFFF','#B22234',
       '#FFFFFF','#B22234','#FFFFFF','#B22234','#FFFFFF','#B22234'].forEach((col,i)=>hStripe(col,i/13,(i+1)/13));
      // Blue canton
      const cw=W*.40,ch=H*(7/13);
      for(let x=0;x<cw;x+=2){const wv=w(x);c.fillStyle='#3C3B6E';c.fillRect(x,wv,2,ch);}
      // 50 stars (9 rows alt 6/5)
      const sw=cw/12,sh=ch/10;
      for(let r=0;r<9;r++){
        const cols=r%2===0?6:5;
        const ox=r%2===0?sw*.8:sw*1.3;
        for(let ci=0;ci<cols;ci++){
          const sx=ox+ci*sw*2,sy=sh*.7+r*sh*1.1;
          if(sx<cw-2) star5(sx,sy,H*.028,H*.012,'#FFFFFF');
        }
      }
      break;
    case'cuba':
      // Cinq bandes ALTERNEES bleu/blanc — trois bleues, deux blanches.
      // La bande centrale etait peinte en rouge : le rouge du drapeau
      // cubain n'apparait que dans le triangle de hampe, dessine juste
      // apres. Le pays emblematique du site portait donc un drapeau faux.
      ['#002A8F','#FFFFFF','#002A8F','#FFFFFF','#002A8F'].forEach((col,i)=>hStripe(col,i/5,(i+1)/5));
      c.fillStyle='#CC0000';c.beginPath();c.moveTo(0,0);c.lineTo(H*.62,H/2);c.lineTo(0,H);c.closePath();c.fill();
      star5(H*.21,H/2,H*.09,H*.038,'#FFFFFF');
      break;
    case'nicaragua':
      hStripe('#3C88CB',0,1/3);hStripe('#FFFFFF',1/3,2/3);hStripe('#3C88CB',2/3,1);
      c.fillStyle='#D71920';c.beginPath();c.moveTo(W*.35,H*.5);c.lineTo(W*.5,H*.28);c.lineTo(W*.65,H*.5);c.lineTo(W*.5,H*.72);c.closePath();c.fill();
      c.fillStyle='#FFFFFF';c.beginPath();c.arc(W/2,H/2,H*.07,0,Math.PI*2);c.fill();
      ['#E8000B','#FF7F00','#FFFF00','#009B3A','#0036A3'].forEach((col,i)=>{
        c.strokeStyle=col;c.lineWidth=H*.018;c.beginPath();c.arc(W/2,H/2+H*.06,H*.14+i*H*.02,Math.PI*1.1,Math.PI*1.9);c.stroke();
      });
      break;
    case'dominican':
      c.fillStyle='#002D62';c.fillRect(0,0,W/2,H/2);
      c.fillStyle='#CF142B';c.fillRect(W/2,0,W/2,H/2);
      c.fillStyle='#CF142B';c.fillRect(0,H/2,W/2,H/2);
      c.fillStyle='#002D62';c.fillRect(W/2,H/2,W/2,H/2);
      c.fillStyle='#FFFFFF';c.fillRect(W*.43,0,W*.14,H);
      c.fillStyle='#FFFFFF';c.fillRect(0,H*.43,W,H*.14);
      // CoA
      c.fillStyle='#FFFFFF';c.beginPath();c.arc(W/2,H/2,H*.1,0,Math.PI*2);c.fill();
      c.fillStyle='#002D62';c.beginPath();c.arc(W/2,H/2,H*.07,0,Math.PI*2);c.fill();
      c.fillStyle='#CF142B';c.beginPath();c.arc(W/2,H/2,H*.035,0,Math.PI*2);c.fill();
      break;
    case'honduras':
      hStripe('#0073CF',0,1/3);hStripe('#FFFFFF',1/3,2/3);hStripe('#0073CF',2/3,1);
      [[.2,.5],[.35,.35],[.5,.5],[.65,.35],[.8,.5]].forEach(([fx,fy])=>star5(fx*W,fy*H,H*.06,H*.025,'#0073CF'));
      break;
    case'ecuador':
      hStripe('#FFCC00',0,.5);hStripe('#003893',.5,.75);hStripe('#CE1126',.75,1);
      c.save();c.beginPath();c.ellipse(W/2,H/2,W*.12,H*.2,0,0,Math.PI*2);
      c.fillStyle='rgba(255,200,0,.25)';c.fill();c.restore();
      break;
    case'cameroon':
      vStripe('#007A5E',0,1/3);vStripe('#CE1126',1/3,2/3);vStripe('#FCD116',2/3,1);
      star5(W/2,H/2,H*.16,H*.07,'#FCD116');
      break;
    case'brazil':
      c.fillStyle='#009C3B';for(let x=0;x<W;x+=2){c.fillRect(x,w(x),2,H);}
      c.fillStyle='#FFDF00';c.beginPath();c.moveTo(W*.5,H*.05);c.lineTo(W*.95,H*.5);c.lineTo(W*.5,H*.95);c.lineTo(W*.05,H*.5);c.closePath();c.fill();
      c.fillStyle='#002776';c.beginPath();c.arc(W/2,H/2,Math.min(W,H)*.26,0,Math.PI*2);c.fill();
      c.strokeStyle='#FFFFFF';c.lineWidth=H*.038;c.beginPath();c.arc(W/2,H/2,Math.min(W,H)*.21,-.35,.35);c.stroke();
      [[.5,.28],[.38,.43],[.62,.43],[.3,.56],[.5,.56],[.7,.56],[.38,.69],[.62,.69]].forEach(([fx,fy])=>{
        c.fillStyle='#FFFFFF';c.beginPath();c.arc(fx*W,fy*H,H*.022,0,Math.PI*2);c.fill();
      });
      break;
    case'indonesia':
      hStripe('#CE1126',0,.5);hStripe('#FFFFFF',.5,1);break;
    case'mexico':
      vStripe('#006847',0,1/3);vStripe('#FFFFFF',1/3,2/3);vStripe('#CE1126',2/3,1);
      c.fillStyle='rgba(139,96,16,.7)';c.beginPath();c.arc(W/2,H/2,H*.13,0,Math.PI*2);c.fill();
      c.fillStyle='#006847';c.beginPath();c.arc(W/2,H/2,H*.09,0,Math.PI*2);c.fill();
      c.strokeStyle='#8B6010';c.lineWidth=1.5;c.beginPath();c.arc(W/2,H/2,H*.1,0,Math.PI*2);c.stroke();
      break;
    case'panama':
      c.fillStyle='#FFFFFF';c.fillRect(0,0,W/2,H/2);
      c.fillStyle='#DA121A';c.fillRect(W/2,0,W/2,H/2);
      c.fillStyle='#003580';c.fillRect(0,H/2,W/2,H/2);
      c.fillStyle='#FFFFFF';c.fillRect(W/2,H/2,W/2,H/2);
      star5(W*.25,H*.25,H*.12,H*.05,'#003580');
      star5(W*.75,H*.75,H*.12,H*.05,'#DA121A');
      break;
    case'philippines':
      hStripe('#0038A8',0,.5);hStripe('#CE1126',.5,1);
      c.fillStyle='#FFFFFF';c.beginPath();c.moveTo(0,0);c.lineTo(H*.72,H/2);c.lineTo(0,H);c.closePath();c.fill();
      const pcx=H*.22,pcy=H/2;
      c.fillStyle='#FCD116';c.beginPath();c.arc(pcx,pcy,H*.1,0,Math.PI*2);c.fill();
      for(let r=0;r<8;r++){const a=r*Math.PI/4;c.strokeStyle='#FCD116';c.lineWidth=H*.013;c.beginPath();c.moveTo(pcx+Math.cos(a)*H*.1,pcy+Math.sin(a)*H*.1);c.lineTo(pcx+Math.cos(a)*H*.19,pcy+Math.sin(a)*H*.19);c.stroke();}
      [[H*.07,H*.08],[H*.9,H*.07],[H*.93,H*.93]].forEach(([sx,sy])=>star5(sx,sy,H*.055,H*.022,'#FCD116'));
      break;
    default:
      hStripe('#999',0,1/3);hStripe('#bbb',1/3,2/3);hStripe('#ddd',2/3,1);
  }
}

var flagT=0,flagRaf=null,bannerRaf=null,lexBannerRaf=null;

// Les douze pays producteurs sont les seuls dont drawFlag() sait tracer
// le drapeau ; tout autre identifiant tombait sur trois bandes grises.
var FLAGS_DESSINES = ['usa','cuba','nicaragua','dominican','honduras','ecuador',
                      'cameroon','brazil','indonesia','mexico','panama','philippines'];

/**
 * Arrete les trois boucles et efface les canvas.
 *
 * Rien ne les arretait : `animateFlags` annulait la precedente au moment
 * d'en lancer une nouvelle, et c'etait tout. Fermer la fiche pays
 * laissait donc trois requestAnimationFrame tourner indefiniment, dont
 * un qui repeint un canvas AUX DIMENSIONS DE LA FENETRE a chaque trame,
 * pour un element devenu invisible.
 *
 * Effacer compte autant qu'arreter : le panneau est partage avec les
 * marches et les pays a lounges, qui n'ont pas de drapeau dessine. Sans
 * effacement, ouvrir la fiche du Japon apres celle de Cuba affichait le
 * nom du Japon sur le drapeau cubain.
 */
function stopFlags(){
  if(flagRaf)cancelAnimationFrame(flagRaf);
  if(bannerRaf)cancelAnimationFrame(bannerRaf);
  if(lexBannerRaf)cancelAnimationFrame(lexBannerRaf);
  flagRaf=bannerRaf=lexBannerRaf=null;
  ['flag-canvas','panel-flag-cvs','lex-flag-cvs'].forEach(function(id){
    var cv=document.getElementById(id);
    if(cv&&cv.width&&cv.height)cv.getContext('2d').clearRect(0,0,cv.width,cv.height);
  });
}

function animateFlags(id,bgCvs,panelCvs,lexCvs){
  stopFlags();
  // Pays sans drapeau dessine : mieux vaut aucun drapeau qu'un mauvais.
  // L'emoji du pays reste affiche dans l'en-tete du panneau.
  if(FLAGS_DESSINES.indexOf(id)===-1)return;

  const fw=window.innerWidth,fh=window.innerHeight;
  bgCvs.width=fw;bgCvs.height=fh;
  panelCvs.width=420;panelCvs.height=115;
  if(lexCvs){lexCvs.width=280;lexCvs.height=100;}

  // « Moins d'animations » : le drapeau est peint UNE fois. On garde
  // l'image — c'est une information sur le pays — on retire le mouvement.
  var fige=(typeof window._reduceMotion==='boolean')?window._reduceMotion:false;
  if(fige){
    drawFlag(bgCvs,id,0);drawFlag(panelCvs,id,0);
    if(lexCvs)drawFlag(lexCvs,id,0);
    return;
  }

  function l1(){drawFlag(bgCvs,id,flagT++);flagRaf=requestAnimationFrame(l1);}
  l1();
  let bt=0;
  function l2(){drawFlag(panelCvs,id,bt++);bannerRaf=requestAnimationFrame(l2);}
  l2();
  if(lexCvs){
    let lt=0;
    function l3(){drawFlag(lexCvs,id,lt++);lexBannerRaf=requestAnimationFrame(l3);}
    l3();
  }
}
window.stopFlags=stopFlags;

// ════════════════════════════════════════════════════════
// COUNTRY DATA
// ════════════════════════════════════════════════════════


