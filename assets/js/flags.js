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
  // Rectangle quelconque, ondule comme les bandes. Les quarts de la
  // Republique dominicaine et du Panama etaient peints au fillRect nu :
  // ils restaient RAIDES pendant que tous les autres flottaient.
  function rect(col,x1f,x2f,y1f,y2f){
    c.fillStyle=col;
    const x0=Math.floor(W*x1f),x1=Math.ceil(W*x2f);
    for(let x=x0;x<x1;x+=2){const wv=w(x);c.fillRect(x,y1f*H+wv,2,(y2f-y1f)*H);}
  }
  // Triangle de hampe, dessine colonne par colonne pour onduler avec le
  // reste. Cuba et les Philippines portent un triangle EQUILATERAL :
  // son sommet est donc a (racine de 3)/2 de la hauteur, soit 0.866 —
  // pas 0.62 ni 0.72, qui donnaient un triangle ecrase.
  const APEX_EQUILATERAL=Math.sqrt(3)/2;
  function triHampe(col,apexF){
    c.fillStyle=col;
    const ax=H*apexF;
    for(let x=0;x<ax;x+=2){
      const k=1-x/ax,wv=w(x);
      c.fillRect(x,H/2-k*H/2+wv,2,k*H);
    }
  }
  function star5(sx,sy,r,r2,fill){
    // Les etoiles suivent l'ondulation du tissu : sans ce decalage,
    // elles flottaient a plat au-dessus d'un drapeau qui bouge.
    sy+=w(sx);
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
      triHampe('#CF142B',APEX_EQUILATERAL);
      star5(H*.29,H/2,H*.11,H*.045,'#FFFFFF');
      break;
    case'nicaragua':
      hStripe('#0067C6',0,1/3);hStripe('#FFFFFF',1/3,2/3);hStripe('#0067C6',2/3,1);
      // L'embleme est un TRIANGLE, pas un losange : cinq volcans sous un
      // arc-en-ciel, coiffes du bonnet phrygien. Un losange rouge n'a
      // rien a voir avec le drapeau nicaraguayen.
      {
        const cx=W/2,cy=H/2+w(W/2),r=H*.19;         // r = demi-cote
        const hy=r*Math.sqrt(3)/2;                   // demi-hauteur
        const tri=()=>{c.beginPath();c.moveTo(cx,cy-hy);c.lineTo(cx+r,cy+hy);c.lineTo(cx-r,cy+hy);c.closePath();};
        tri();c.fillStyle='#F5F5F5';c.fill();
        c.save();tri();c.clip();
        // Ciel
        c.fillStyle='#BFD9F2';c.fillRect(cx-r,cy-hy,r*2,hy*2);
        // Arc-en-ciel, cintre au-dessus des volcans
        ['#D62828','#F77F00','#FCBF49','#4CAF50','#3F51B5'].forEach((col,i)=>{
          c.strokeStyle=col;c.lineWidth=H*.012;
          c.beginPath();c.arc(cx,cy+hy*.45,r*.62-i*H*.012,Math.PI,Math.PI*2);c.stroke();
        });
        // Cinq volcans, le plus haut au centre
        [[-.52,.30],[-.27,.42],[0,.52],[.27,.42],[.52,.30]].forEach(([fx,fh])=>{
          const bx=cx+fx*r,by=cy+hy*.62,ht=hy*fh*2;
          c.fillStyle='#2E6B4F';c.beginPath();
          c.moveTo(bx,by-ht);c.lineTo(bx+r*.22,by);c.lineTo(bx-r*.22,by);c.closePath();c.fill();
        });
        // Bonnet phrygien
        c.fillStyle='#D62828';c.beginPath();
        c.arc(cx,cy+hy*.02,r*.11,Math.PI,Math.PI*2);c.fill();
        c.restore();
        tri();c.strokeStyle='#D4AF37';c.lineWidth=H*.012;c.stroke();
      }
      break;
    case'dominican':
      // Quarts ondulants : hampe haute bleue, vol haut rouge, hampe
      // basse rouge, vol bas bleu.
      rect('#002D62',0,.5,0,.5);rect('#CE1126',.5,1,0,.5);
      rect('#CE1126',0,.5,.5,1);rect('#002D62',.5,1,.5,1);
      rect('#FFFFFF',.43,.57,0,1);hStripe('#FFFFFF',.43,.57);
      // Les armes : ecu ecartele frappe d'une croix, ceint de laurier et
      // de palme. A cette taille c'est une STYLISATION, pas un fac-simile.
      {
        const cx=W/2,cy=H/2+w(W/2),r=H*.105;
        c.fillStyle='#FFFFFF';c.beginPath();c.arc(cx,cy,r,0,Math.PI*2);c.fill();
        c.strokeStyle='#2E6B4F';c.lineWidth=H*.016;
        c.beginPath();c.arc(cx,cy,r*.92,Math.PI*.55,Math.PI*1.45);c.stroke();
        c.strokeStyle='#D4AF37';
        c.beginPath();c.arc(cx,cy,r*.92,Math.PI*1.55,Math.PI*.45);c.stroke();
        c.fillStyle='#002D62';c.fillRect(cx-r*.52,cy-r*.52,r*.52,r*.52);
        c.fillRect(cx,cy,r*.52,r*.52);
        c.fillStyle='#CE1126';c.fillRect(cx,cy-r*.52,r*.52,r*.52);
        c.fillRect(cx-r*.52,cy,r*.52,r*.52);
        c.fillStyle='#FFFFFF';c.fillRect(cx-r*.09,cy-r*.55,r*.18,r*1.1);
        c.fillRect(cx-r*.55,cy-r*.09,r*1.1,r*.18);
      }
      break;
    case'honduras':
      hStripe('#0073CF',0,1/3);hStripe('#FFFFFF',1/3,2/3);hStripe('#0073CF',2/3,1);
      // Cinq etoiles en QUINCONCE — quatre aux angles d'un carre, une au
      // centre — et toutes dans la bande blanche. Elles etaient etalees
      // en zigzag sur toute la largeur, deux d'entre elles mordant sur
      // le bleu.
      [[.42,.40],[.58,.40],[.5,.5],[.42,.60],[.58,.60]]
        .forEach(([fx,fy])=>star5(fx*W,fy*H,H*.05,H*.021,'#0073CF'));
      break;
    case'ecuador':
      hStripe('#FFDD00',0,.5);hStripe('#034EA2',.5,.75);hStripe('#ED1C24',.75,1);
      // Les armes : le Chimborazo, le vapeur Guayas et le condor aux
      // ailes ouvertes. C'etait une tache grise translucide — donc rien.
      // Ce qui suit reste une STYLISATION : a 30 px, le condor est une
      // silhouette, pas un blason.
      {
        const cx=W/2,cy=H/2+w(W/2),r=H*.17;
        // Ovale du blason
        c.fillStyle='#EAF2FB';c.beginPath();c.ellipse(cx,cy+r*.12,r*.62,r*.72,0,0,Math.PI*2);c.fill();
        c.save();c.beginPath();c.ellipse(cx,cy+r*.12,r*.62,r*.72,0,0,Math.PI*2);c.clip();
        c.fillStyle='#7E9FBF';c.beginPath();          // le Chimborazo
        c.moveTo(cx,cy-r*.42);c.lineTo(cx+r*.6,cy+r*.3);c.lineTo(cx-r*.6,cy+r*.3);c.closePath();c.fill();
        c.fillStyle='#FFFFFF';c.beginPath();          // ses neiges
        c.moveTo(cx,cy-r*.42);c.lineTo(cx+r*.2,cy-r*.1);c.lineTo(cx-r*.2,cy-r*.1);c.closePath();c.fill();
        c.fillStyle='#2E6B8F';c.fillRect(cx-r*.62,cy+r*.3,r*1.24,r*.55); // le fleuve
        c.fillStyle='#6B4423';c.fillRect(cx-r*.22,cy+r*.34,r*.44,r*.14); // le vapeur
        c.restore();
        c.strokeStyle='#D4AF37';c.lineWidth=H*.01;
        c.beginPath();c.ellipse(cx,cy+r*.12,r*.62,r*.72,0,0,Math.PI*2);c.stroke();
        // Le condor, ailes deployees au-dessus
        c.strokeStyle='#3B3B3B';c.lineWidth=H*.016;c.beginPath();
        c.moveTo(cx-r*.85,cy-r*.5);c.quadraticCurveTo(cx,cy-r*1.05,cx+r*.85,cy-r*.5);c.stroke();
      }
      break;
    case'cameroon':
      vStripe('#007A5E',0,1/3);vStripe('#CE1126',1/3,2/3);vStripe('#FCD116',2/3,1);
      star5(W/2,H/2,H*.16,H*.07,'#FCD116');
      break;
    case'brazil':
      c.fillStyle='#009C3B';for(let x=0;x<W;x+=2){c.fillRect(x,w(x),2,H);}
      // Le losange est INSCRIT a 1,7/20 des bords en largeur et 1,7/14
      // en hauteur — pas colle aux angles.
      {
        const dy=w(W/2),ix=.085,iy=.121;
        c.fillStyle='#FFDF00';c.beginPath();
        c.moveTo(W*.5,H*iy+dy);c.lineTo(W*(1-ix),H*.5+dy);
        c.lineTo(W*.5,H*(1-iy)+dy);c.lineTo(W*ix,H*.5+dy);c.closePath();c.fill();
        const R=Math.min(W,H)*.26,cx=W/2,cy=H/2+dy;
        c.fillStyle='#002776';c.beginPath();c.arc(cx,cy,R,0,Math.PI*2);c.fill();
        // La banderole TRAVERSE le globe en arc ascendant. Elle etait
        // reduite a un arc de 0,7 radian sur le flanc droit du cercle,
        // ce qui ne ressemblait a rien.
        c.save();c.beginPath();c.arc(cx,cy,R,0,Math.PI*2);c.clip();
        c.strokeStyle='#FFFFFF';c.lineWidth=R*.30;
        c.beginPath();c.arc(cx,cy+R*1.55,R*1.75,Math.PI*1.22,Math.PI*1.78);c.stroke();
        c.restore();
        // Vingt-sept etoiles : une par Etat, plus le district federal.
        // Elles etaient huit.
        const etoiles=[[-.10,-.62],[.02,-.60],[.14,-.55],[-.30,-.42],[-.18,-.40],[-.05,-.38],
          [.10,-.36],[.24,-.34],[.38,-.30],[-.46,-.22],[-.34,-.18],[-.20,-.16],[-.06,-.14],
          [.08,-.12],[.22,-.10],[.36,-.08],[.50,-.04],[-.40,.04],[-.26,.08],[-.12,.10],
          [.02,.12],[.16,.16],[.30,.20],[-.20,.30],[-.06,.34],[.08,.38],[.22,.44]];
        c.fillStyle='#FFFFFF';
        etoiles.forEach(([fx,fy],i)=>{
          c.beginPath();c.arc(cx+fx*R,cy+fy*R,R*(i%4===0?.075:.05),0,Math.PI*2);c.fill();
        });
      }
      break;
    case'indonesia':
      hStripe('#CE1126',0,.5);hStripe('#FFFFFF',.5,1);break;
    case'mexico':
      vStripe('#006847',0,1/3);vStripe('#FFFFFF',1/3,2/3);vStripe('#CE1126',2/3,1);
      // L'aigle sur le nopal, serpent au bec. C'etait un empilement de
      // trois disques — un blason ne se lit pas dans un rond.
      {
        const cx=W/2,cy=H/2+w(W/2),r=H*.15;
        c.fillStyle='#2E6B4F';                        // les raquettes du nopal
        [[-.30,.34],[.30,.34],[0,.46]].forEach(([fx,fy])=>{
          c.beginPath();c.ellipse(cx+fx*r,cy+fy*r,r*.24,r*.17,0,0,Math.PI*2);c.fill();
        });
        c.fillStyle='#6B4423';                        // le rocher
        c.beginPath();c.ellipse(cx,cy+r*.60,r*.52,r*.14,0,0,Math.PI*2);c.fill();
        c.fillStyle='#5C4033';                        // le corps de l'aigle
        c.beginPath();c.ellipse(cx+r*.05,cy+r*.05,r*.20,r*.30,.2,0,Math.PI*2);c.fill();
        c.beginPath();                                // l'aile deployee
        c.moveTo(cx,cy-r*.12);c.quadraticCurveTo(cx+r*.55,cy-r*.75,cx+r*.62,cy-r*.10);
        c.quadraticCurveTo(cx+r*.35,cy-r*.18,cx,cy-r*.12);c.closePath();c.fill();
        c.beginPath();                                // la tete penchee
        c.ellipse(cx-r*.20,cy-r*.26,r*.12,r*.10,-.4,0,Math.PI*2);c.fill();
        c.strokeStyle='#2E6B4F';c.lineWidth=H*.012;   // le serpent
        c.beginPath();c.moveTo(cx-r*.30,cy-r*.24);
        c.quadraticCurveTo(cx-r*.62,cy-r*.02,cx-r*.34,cy+r*.20);c.stroke();
        c.strokeStyle='#2E6B4F';c.lineWidth=H*.014;   // laurier et chene
        c.beginPath();c.arc(cx,cy+r*.30,r*.80,Math.PI*.18,Math.PI*.82);c.stroke();
      }
      break;
    case'panama':
      rect('#FFFFFF',0,.5,0,.5);rect('#DA121A',.5,1,0,.5);
      rect('#003580',0,.5,.5,1);rect('#FFFFFF',.5,1,.5,1);
      star5(W*.25,H*.25,H*.12,H*.05,'#003580');
      star5(W*.75,H*.75,H*.12,H*.05,'#DA121A');
      break;
    case'philippines':
      hStripe('#0038A8',0,.5);hStripe('#CE1126',.5,1);
      triHampe('#FFFFFF',APEX_EQUILATERAL);
      {
        const AP=H*APEX_EQUILATERAL,pcx=AP*.42,pcy=H/2,dy=w(pcx);
        c.fillStyle='#FCD116';c.beginPath();c.arc(pcx,pcy+dy,H*.085,0,Math.PI*2);c.fill();
        // Huit rayons — un par province entree en revolution en 1896.
        for(let r=0;r<8;r++){
          const a=r*Math.PI/4;c.strokeStyle='#FCD116';c.lineWidth=H*.013;c.beginPath();
          c.moveTo(pcx+Math.cos(a)*H*.085,pcy+dy+Math.sin(a)*H*.085);
          c.lineTo(pcx+Math.cos(a)*H*.16,pcy+dy+Math.sin(a)*H*.16);c.stroke();
        }
        // Les trois etoiles occupent les SOMMETS du triangle. Deux
        // d'entre elles etaient posees a droite du drapeau, en plein
        // champ bleu et rouge, tres loin du triangle blanc.
        [[AP*.14,H*.14],[AP*.14,H*.86],[AP*.80,H*.5]]
          .forEach(([sx,sy])=>star5(sx,sy,H*.052,H*.021,'#FCD116'));
      }
      break;
    // ── Les quatre que l'atlas annonçait sans savoir les tracer ──
    case'italy':
      vStripe('#008C45',0,1/3);vStripe('#F4F5F0',1/3,2/3);vStripe('#CD212A',2/3,1);
      break;
    case'costarica':
      // Cinq bandes de hauteurs INEGALES — 1:1:2:1:1. La rouge est
      // double, et c'est ce qui distingue ce drapeau de tous les autres
      // tricolores horizontaux.
      hStripe('#0B4EA2',0,1/6);hStripe('#FFFFFF',1/6,2/6);
      hStripe('#CE1126',2/6,4/6);
      hStripe('#FFFFFF',4/6,5/6);hStripe('#0B4EA2',5/6,1);
      break;
    case'canaries':
      // Les Canaries ont leur PROPRE drapeau — blanc, bleu, jaune. La
      // fiche porte le drapeau espagnol faute de mieux (l'emoji ne
      // distingue pas les communautes autonomes), mais le drapeau
      // dessine, lui, peut dire vrai. Meme raison d'etre que
      // TERRITOIRES_INFOS dans data.pays.js : un territoire qui arbore
      // le pavillon de son Etat n'en herite pas tout le reste.
      vStripe('#FFFFFF',0,1/3);vStripe('#0844A4',1/3,2/3);vStripe('#FFC400',2/3,1);
      break;
    case'jamaica':
      // Sautoir d'or : triangles vert en haut et en bas, noirs a la
      // hampe et au vol. Trace colonne par colonne pour onduler.
      for(let x=0;x<W;x+=2){
        const wv=w(x),f=x/W,ya=f*H,yb=H-f*H,y1=Math.min(ya,yb),y2=Math.max(ya,yb);
        c.fillStyle='#009B3A';c.fillRect(x,wv,2,y1);                 // haut
        c.fillStyle='#000000';c.fillRect(x,y1+wv,2,y2-y1);           // hampe / vol
        c.fillStyle='#009B3A';c.fillRect(x,y2+wv,2,H-y2);            // bas
        const g=H*.085;
        c.fillStyle='#FED100';
        c.fillRect(x,ya-g/2+wv,2,g);c.fillRect(x,yb-g/2+wv,2,g);     // le sautoir
      }
      break;
    default:
      hStripe('#999',0,1/3);hStripe('#bbb',1/3,2/3);hStripe('#ddd',2/3,1);
  }
}

var flagT=0,flagRaf=null,bannerRaf=null,lexBannerRaf=null;

// Les pays dont drawFlag() sait tracer le drapeau ; tout autre
// identifiant tombe sur trois bandes grises.
//
// CETTE LISTE DOIT COUVRIR TOUS LES PAYS PRODUCTEURS. Elle en comptait
// douze quand l'atlas en avait seize : le Costa Rica, les Canaries, la
// Jamaique et l'Italie affichaient des bandes grises, et rien ne le
// signalait — trois bandes grises est un dessin comme un autre pour qui
// ne connait pas le drapeau attendu. `tools/coherence_check.php`
// compare desormais cette liste a `producer_countries`.
var FLAGS_DESSINES = ['usa','cuba','nicaragua','dominican','honduras','ecuador',
                      'cameroon','brazil','indonesia','mexico','panama','philippines',
                      'costarica','canaries','jamaica','italy'];

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


