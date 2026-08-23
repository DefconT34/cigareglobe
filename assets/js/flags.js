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
//
// ── POURQUOI UNE TABLE PLUTOT QUE CENT « case » ─────────
//
// Les seize premiers drapeaux etaient ecrits un par un, en code. A
// quatre-vingt-quatorze, cette facon de faire ne tient plus : chaque
// tricolore aurait recopie les memes trois lignes, et une faute de
// frappe dans l'une d'elles serait invisible.
//
// La grande majorite des drapeaux du monde se decrit par des BANDES
// plus, parfois, une figure. Ceux-la vivent dans FLAGS_SPEC, en une
// ligne chacun. Seuls les drapeaux qui n'entrent dans aucun moule —
// l'Union Jack, le Y sud-africain, le taegeuk coreen — gardent leur
// `case` dedie.
//
// Format :
//   h  : bandes horizontales EGALES, de haut en bas
//   v  : bandes verticales EGALES, de la hampe au vol
//   hp : bandes horizontales PONDEREES [[couleur, poids], ...]
//   vp : idem, verticales
//   o  : figures posees par-dessus, dans l'ordre (voir figure() plus bas)
//
// Les fractions sont relatives : hp accepte [[c,1],[c,2],[c,1]] aussi
// bien que des quarts explicites.
var FLAGS_SPEC = {
  // ── Europe ────────────────────────────────────────────
  france:      {v:['#002395','#FFFFFF','#ED2939']},
  stmartin:    {v:['#002395','#FFFFFF','#ED2939']},   // Saint-Martin arbore le pavillon francais
  belgium:     {v:['#000000','#FDDA24','#EF3340']},
  romania:     {v:['#002B7F','#FCD116','#CE1126']},
  germany:     {h:['#000000','#DD0000','#FFCE00']},
  netherlands: {h:['#AE1C28','#FFFFFF','#21468B']},
  russia:      {h:['#FFFFFF','#0039A6','#D52B1E']},
  luxembourg:  {h:['#ED2939','#FFFFFF','#00A1DE']},   // le bleu est plus clair qu'aux Pays-Bas
  austria:     {h:['#ED2939','#FFFFFF','#ED2939']},
  bulgaria:    {h:['#FFFFFF','#00966E','#D62612']},
  armenia:     {h:['#D90012','#0033A0','#F2A800']},
  ukraine:     {h:['#005BBB','#FFD500']},
  poland:      {h:['#FFFFFF','#DC143C']},
  monaco:      {h:['#CE1126','#FFFFFF']},
  czech:       {h:['#FFFFFF','#D7141A'], o:[['tri','#11457E',0.55]]},
  spain:       {hp:[['#AA151B',1],['#F1BF00',2],['#AA151B',1]],
                o:[['ecu','#AD1519','#F1BF00',0.28,0.5,0.17]]},
  portugal:    {vp:[['#006600',2],['#FF0000',3]],
                o:[['sphere','#FFD700','#FFFFFF',0.4,0.5,0.20]]},
  gibraltar:   {hp:[['#FFFFFF',2],['#DA000C',1]],
                o:[['chateau','#DA000C',0.5,0.36,0.22],['cle','#FFD700',0.5,0.72,0.12]]},
  croatia:     {h:['#FF0000','#FFFFFF','#171796'], o:[['damier','#FF0000',0.5,0.5,0.20]]},
  serbia:      {h:['#C6363C','#0C4076','#FFFFFF'], o:[['ecu','#C6363C','#FFD700',0.35,0.5,0.19]]},
  albania:     {h:['#E41E20'], o:[['aigle','#000000',0.5,0.5,0.32]]},
  switzerland: {h:['#FF0000'], o:[['croixSuisse','#FFFFFF',0.5,0.5,0.34]]},
  andorra:     {v:['#10069F','#FEDD00','#D50032'],
                o:[['ecu','#D50032','#FEDD00',0.5,0.5,0.17]]},
  // ── Amerique ──────────────────────────────────────────
  canada:      {vp:[['#FF0000',1],['#FFFFFF',2],['#FF0000',1]],
                o:[['erable','#FF0000',0.5,0.5,0.30]]},
  peru:        {v:['#D91023','#FFFFFF','#D91023']},
  colombia:    {hp:[['#FCD116',2],['#003893',1],['#CE1126',1]]},
  venezuela:   {h:['#FFCC00','#00247D','#CF0821'], o:[['arcEtoiles','#FFFFFF',0.5,0.5,0.26,8]]},
  paraguay:    {h:['#D52B1E','#FFFFFF','#0038A8'],
                o:[['disque','#FFFFFF',0.5,0.5,0.13],['etoile','#009B3A',0.5,0.5,0.075,0.032]]},
  guatemala:   {v:['#4997D0','#FFFFFF','#4997D0'], o:[['couronne','#4E5B31',0.5,0.5,0.20]]},
  argentina:   {h:['#74ACDF','#FFFFFF','#74ACDF'], o:[['soleil','#F6B40E',0.5,0.5,0.13]]},
  chile:       {hp:[['#FFFFFF',1],['#D52B1E',1]],
                o:[['canton','#0039A6',0.333,0.5],['etoile','#FFFFFF',0.1665,0.25,0.11,0.045]]},
  barbados:    {v:['#00267F','#FFC726','#00267F'], o:[['trident','#000000',0.5,0.5,0.26]]},
  aruba:       {h:['#418FDE'],
                o:[['bande','#F9E814',0,1,0.62,0.70],['bande','#F9E814',0,1,0.76,0.84],
                   ['etoile4','#EF3340','#FFFFFF',0.17,0.28,0.135]]},
  stkitts:     {o:[['diagStKitts']]},
  caymanisles: {o:[['ensign','#00247D']]},
  // ── Afrique ───────────────────────────────────────────
  ivorycoast:  {v:['#F77F00','#FFFFFF','#009E60']},
  guinea:      {v:['#CE1126','#FCD116','#009460']},
  mali:        {v:['#14B53A','#FCD116','#CE1126']},
  nigeria:     {v:['#008751','#FFFFFF','#008751']},
  senegal:     {v:['#00853F','#FDEF42','#E31B23'], o:[['etoile','#00853F',0.5,0.5,0.16,0.066]]},
  ghana:       {h:['#CE1126','#FCD116','#006B3F'], o:[['etoile','#000000',0.5,0.5,0.16,0.066]]},
  ethiopia:    {h:['#078930','#FCDD09','#DA121A'],
                o:[['disque','#0F47AF',0.5,0.5,0.24],['etoileRayons','#FCDD09',0.5,0.5,0.17]]},
  egypt:       {h:['#CE1126','#FFFFFF','#000000'], o:[['aigle','#C09300',0.5,0.5,0.22]]},
  burkina:     {h:['#EF2B2D','#009E49'], o:[['etoile','#FCD116',0.5,0.5,0.17,0.070]]},
  morocco:     {h:['#C1272D'], o:[['pentacle','#006233',0.5,0.5,0.26]]},
  botswana:    {hp:[['#75AADB',9],['#FFFFFF',1],['#000000',4],['#FFFFFF',1],['#75AADB',9]]},
  kenya:       {hp:[['#000000',4],['#FFFFFF',1],['#BB0000',5],['#FFFFFF',1],['#006600',4]],
                o:[['bouclier','#BB0000','#FFFFFF',0.5,0.5,0.30]]},
  southafrica: {o:[['ySudAfricain']]},
  benin:       {o:[['benin']]},
  togo:        {o:[['togo']]},
  tanzania:    {o:[['tanzanie']]},
  // ── Asie et Moyen-Orient ──────────────────────────────
  japan:       {h:['#FFFFFF'], o:[['disque','#BC002D',0.5,0.5,0.30]]},
  china:       {h:['#EE1C25'], o:[['etoilesChine','#FFFF00']]},
  taiwan:      {h:['#FE0000'], o:[['canton','#000095',0.5,0.5],['soleilTaiwan','#FFFFFF',0.25,0.25,0.16]]},
  hongkong:    {h:['#DE2910'], o:[['bauhinia','#FFFFFF',0.5,0.5,0.24]]},
  vietnam:     {h:['#DA251D'], o:[['etoile','#FFFF00',0.5,0.5,0.24,0.098]]},
  singapore:   {hp:[['#EF3340',1],['#FFFFFF',1]],
                o:[['croissant','#FFFFFF',0.16,0.25,0.15],['etoilesSingapour','#FFFFFF']]},
  turkey:      {h:['#E30A17'],
                o:[['croissant','#FFFFFF',0.35,0.5,0.22],['etoile','#FFFFFF',0.545,0.5,0.10,0.041]]},
  azerbaijan:  {h:['#0092BC','#E4002B','#00AF66'],
                o:[['croissant','#FFFFFF',0.47,0.5,0.15],['etoile','#FFFFFF',0.585,0.5,0.075,0.031]]},
  india:       {h:['#FF9933','#FFFFFF','#138808'], o:[['chakra','#000080',0.5,0.5,0.145]]},
  thailand:    {hp:[['#A51931',1],['#F4F5F8',1],['#2D2A4A',2],['#F4F5F8',1],['#A51931',1]]},
  cambodia:    {hp:[['#032EA1',1],['#E00025',2],['#032EA1',1]],
                o:[['angkor','#FFFFFF',0.5,0.5,0.26]]},
  malaysia:    {o:[['malaisie']]},
  southkorea:  {h:['#FFFFFF'], o:[['taegeuk',0.5,0.5,0.20],['trigrammes','#000000']]},
  iran:        {h:['#239F40','#FFFFFF','#DA0000'], o:[['embleme','#DA0000',0.5,0.5,0.13]]},
  israel:      {h:['#FFFFFF'],
                o:[['bande','#0038B8',0,1,0.17,0.27],['bande','#0038B8',0,1,0.73,0.83],
                   ['hexagramme','#0038B8',0.5,0.5,0.19]]},
  lebanon:     {hp:[['#ED1C24',1],['#FFFFFF',2],['#ED1C24',1]],
                o:[['cedre','#00A651',0.5,0.5,0.22]]},
  saudiarabia: {h:['#165D31'], o:[['shahada','#FFFFFF']]},
  uae:         {o:[['hampeGauche','#FF0000',0.25,['#00732F','#FFFFFF','#000000']]]},
  kuwait:      {o:[['hampeTrapeze','#000000',0.25,['#007A3D','#FFFFFF','#CE1126']]]},
  qatar:       {o:[['dentele','#FFFFFF','#8A1538',0.30,9]]},
  bahrain:     {o:[['dentele','#FFFFFF','#CE1126',0.33,5]]},
  oman:        {o:[['oman']]},
  cyprus:      {h:['#FFFFFF'], o:[['chypre']]},
  greece:      {o:[['grece']]},
  uk:          {o:[['unionJack']]},
  // Le champ bleu est INDISPENSABLE : sans lui, `australie` ne posait
  // que le canton et les etoiles sur un canvas transparent, et le
  // drapeau sortait blanc.
  australia:   {h:['#00247D'], o:[['australie']]},
  eu_mkt:      {h:['#003399'], o:[['cercleEtoiles','#FFCC00',0.5,0.5,0.30,12]]}
};

// Les fiches de marche pointent le meme pays que les fiches a lounges :
// pas de raison d'en redessiner le drapeau. Seule l'Union europeenne
// n'a pas de jumeau, et garde son entree propre.
var FLAGS_ALIAS = {
  usa_mkt:'usa', china_mkt:'china', japan_mkt:'japan', uae_mkt:'uae',
  uk_mkt:'uk', russia_mkt:'russia', canada_mkt:'canada',
  france_mkt:'france', switz_mkt:'switzerland'
};

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
  // Etoile a N branches — l'etoile a cinq pointes n'est qu'un cas
  // particulier, mais le Maroc en veut une a cinq evidee et la Malaisie
  // une a quatorze.
  function etoileN(sx,sy,r,r2,n,fill,trait){
    sy+=w(sx);
    c.beginPath();
    for(let p=0;p<n;p++){
      const a=p*2*Math.PI/n-Math.PI/2,a2=a+Math.PI/n;
      p===0?c.moveTo(sx+Math.cos(a)*r,sy+Math.sin(a)*r):c.lineTo(sx+Math.cos(a)*r,sy+Math.sin(a)*r);
      c.lineTo(sx+Math.cos(a2)*r2,sy+Math.sin(a2)*r2);
    }
    c.closePath();
    if(trait){c.strokeStyle=fill;c.lineWidth=H*.016;c.stroke();}else{c.fillStyle=fill;c.fill();}
  }
  // Croissant : deux disques decales, regle « pair-impair ». Dessiner un
  // disque de fond par-dessus ne marcherait pas — le fond ondule.
  function croissant(col,cx,cy,r,creux){
    cy+=w(cx);
    c.fillStyle=col;c.beginPath();
    c.arc(cx,cy,r,0,Math.PI*2);
    c.arc(cx+r*(creux||.30),cy,r*.86,0,Math.PI*2);
    c.fill('evenodd');
  }
  function disque(col,cx,cy,r){c.fillStyle=col;c.beginPath();c.arc(cx,cy+w(cx),r,0,Math.PI*2);c.fill();}

  // ── Bandes ────────────────────────────────────────────
  function bandes(spec){
    const poids=(l)=>l.map(x=>Array.isArray(x)?x[1]:1);
    let liste,horiz;
    if(spec.h){liste=spec.h.map(c0=>[c0,1]);horiz=true;}
    else if(spec.v){liste=spec.v.map(c0=>[c0,1]);horiz=false;}
    else if(spec.hp){liste=spec.hp;horiz=true;}
    else if(spec.vp){liste=spec.vp;horiz=false;}
    else return;
    const tot=poids(liste).reduce((a,b)=>a+b,0);
    let acc=0;
    liste.forEach(([col,p])=>{
      const a=acc/tot,b=(acc+p)/tot;acc+=p;
      horiz?hStripe(col,a,b):vStripe(col,a,b);
    });
  }

  // ── Figures ───────────────────────────────────────────
  //
  // Les emblemes complexes — aigle egyptien, sphere armillaire
  // portugaise, blason espagnol — sont des STYLISATIONS assumees. A
  // trente pixels de haut, un blason est une silhouette : on cherche la
  // lecture juste (« un aigle », « une sphere »), pas le fac-simile.
  function figure(op){
    const k=op[0],A=op;
    switch(k){
      case'disque':      disque(A[1],A[2]*W,A[3]*H,A[4]*H);break;
      case'etoile':      star5(A[2]*W,A[3]*H,A[4]*H,A[5]*H,A[1]);break;
      case'etoile4':     etoileN(A[3]*W,A[4]*H,A[5]*H,A[5]*H*.30,4,A[1]);
                         etoileN(A[3]*W,A[4]*H,A[5]*H,A[5]*H*.30,4,A[2],true);break;
      case'etoileRayons':{const cx=A[2]*W,cy=A[3]*H+w(A[2]*W),r=A[4]*H;
                         star5(A[2]*W,A[3]*H,r*.55,r*.23,A[1]);
                         c.strokeStyle=A[1];c.lineWidth=H*.010;
                         for(let i=0;i<12;i++){const a=i*Math.PI/6;
                           c.beginPath();c.moveTo(cx+Math.cos(a)*r*.62,cy+Math.sin(a)*r*.62);
                           c.lineTo(cx+Math.cos(a)*r,cy+Math.sin(a)*r);c.stroke();}
                         }break;
      case'cercleEtoiles':{const n=A[6]||12;
                         for(let i=0;i<n;i++){const a=i*2*Math.PI/n-Math.PI/2;
                           star5(A[2]*W+Math.cos(a)*A[4]*H,A[3]*H+Math.sin(a)*A[4]*H,H*.055,H*.023,A[1]);}
                         }break;
      case'arcEtoiles': {const n=A[6]||8;
                         for(let i=0;i<n;i++){const a=Math.PI*(1.18+.64*i/(n-1));
                           star5(A[2]*W+Math.cos(a)*A[4]*W*.5,A[3]*H+H*.30+Math.sin(a)*A[4]*H*1.5,H*.045,H*.019,A[1]);}
                         }break;
      case'etoilesChine':{star5(W*.115,H*.28,H*.115,H*.048,A[1]);
                         [[.235,.13],[.30,.235],[.30,.395],[.235,.50]].forEach(([fx,fy])=>
                           star5(fx*W,fy*H,H*.042,H*.017,A[1]));
                         }break;
      case'etoilesSingapour':{[[.255,.155],[.325,.215],[.185,.215],[.215,.315],[.295,.315]]
                         .forEach(([fx,fy])=>star5(fx*W,fy*H,H*.048,H*.020,A[1]));
                         }break;
      case'croissant':   croissant(A[1],A[2]*W,A[3]*H,A[4]*H,A[5]);break;
      case'pentacle':    etoileN(A[2]*W,A[3]*H,A[4]*H,A[4]*H*.48,5,A[1],true);break;
      case'hexagramme': {const cx=A[2]*W,cy=A[3]*H+w(A[2]*W),r=A[4]*H;
                         c.strokeStyle=A[1];c.lineWidth=H*.026;
                         [0,Math.PI].forEach(off=>{c.beginPath();
                           for(let p=0;p<3;p++){const a=off+p*2*Math.PI/3-Math.PI/2;
                             p===0?c.moveTo(cx+Math.cos(a)*r,cy+Math.sin(a)*r)
                                  :c.lineTo(cx+Math.cos(a)*r,cy+Math.sin(a)*r);}
                           c.closePath();c.stroke();});
                         }break;
      case'chakra':     {const cx=A[2]*W,cy=A[3]*H+w(A[2]*W),r=A[4]*H;
                         c.strokeStyle=A[1];c.lineWidth=H*.012;
                         c.beginPath();c.arc(cx,cy,r,0,Math.PI*2);c.stroke();
                         c.lineWidth=H*.006;
                         for(let i=0;i<24;i++){const a=i*Math.PI/12;
                           c.beginPath();c.moveTo(cx,cy);
                           c.lineTo(cx+Math.cos(a)*r,cy+Math.sin(a)*r);c.stroke();}
                         disque(A[1],A[2]*W,A[3]*H,r*.16);
                         }break;
      case'tri':         triHampe(A[1],A[2]);break;
      case'canton':     {const cw=W*A[2],ch=H*A[3];
                         c.fillStyle=A[1];
                         for(let x=0;x<cw;x+=2){c.fillRect(x,w(x),2,ch);}
                         }break;
      case'bande':       rect(A[1],A[2],A[3],A[4],A[5]);break;
      case'croixSuisse':{const cx=A[2]*W,cy=A[3]*H,r=A[4]*H,e=r*.32;
                         rect(A[1],(cx-e/2)/W,(cx+e/2)/W,(cy-r/2)/H,(cy+r/2)/H);
                         rect(A[1],(cx-r/2)/W,(cx+r/2)/W,(cy-e/2)/H,(cy+e/2)/H);
                         }break;
      case'erable':     {const cx=A[2]*W,cy=A[3]*H+w(A[2]*W),r=A[4]*H;
                         // Onze pointes, comme la feuille officielle.
                         const p=[[0,-1],[.13,-.62],[.36,-.68],[.28,-.42],[.62,-.13],[.5,-.03],
                                  [.56,.22],[.22,.16],[.13,.28],[.08,.72],[-.08,.72],[-.13,.28],
                                  [-.22,.16],[-.56,.22],[-.5,-.03],[-.62,-.13],[-.28,-.42],
                                  [-.36,-.68],[-.13,-.62]];
                         c.fillStyle=A[1];c.beginPath();
                         p.forEach(([fx,fy],i)=>i?c.lineTo(cx+fx*r,cy+fy*r):c.moveTo(cx+fx*r,cy+fy*r));
                         c.closePath();c.fill();
                         }break;
      case'trident':    {const cx=A[2]*W,cy=A[3]*H+w(A[2]*W),r=A[4]*H;
                         c.fillStyle=A[1];
                         c.fillRect(cx-r*.07,cy-r*.15,r*.14,r*1.05);
                         c.fillRect(cx-r*.62,cy-r*.30,r*1.24,r*.13);
                         [-.55,0,.55].forEach(fx=>{c.beginPath();
                           c.moveTo(cx+fx*r-r*.11,cy-r*.30);c.lineTo(cx+fx*r,cy-r*.95);
                           c.lineTo(cx+fx*r+r*.11,cy-r*.30);c.closePath();c.fill();});
                         }break;
      case'ecu':        {const cx=A[3]*W,cy=A[4]*H+w(A[3]*W),r=A[5]*H;
                         c.fillStyle=A[1];c.beginPath();
                         c.moveTo(cx-r*.62,cy-r*.85);c.lineTo(cx+r*.62,cy-r*.85);
                         c.lineTo(cx+r*.62,cy+r*.18);c.quadraticCurveTo(cx,cy+r*1.1,cx-r*.62,cy+r*.18);
                         c.closePath();c.fill();
                         c.strokeStyle=A[2];c.lineWidth=H*.011;c.stroke();
                         }break;
      case'sphere':     {const cx=A[3]*W,cy=A[4]*H+w(A[3]*W),r=A[5]*H;
                         c.strokeStyle=A[1];c.lineWidth=H*.013;
                         c.beginPath();c.arc(cx,cy,r,0,Math.PI*2);c.stroke();
                         [.34,.66].forEach(k=>{c.beginPath();
                           c.ellipse(cx,cy,r*k,r,0,0,Math.PI*2);c.stroke();});
                         c.beginPath();c.moveTo(cx-r,cy);c.lineTo(cx+r,cy);c.stroke();
                         c.fillStyle=A[2];c.beginPath();
                         c.moveTo(cx-r*.34,cy-r*.42);c.lineTo(cx+r*.34,cy-r*.42);
                         c.lineTo(cx+r*.34,cy+r*.10);c.quadraticCurveTo(cx,cy+r*.62,cx-r*.34,cy+r*.10);
                         c.closePath();c.fill();
                         }break;
      case'chateau':    {const cx=A[2]*W,cy=A[3]*H+w(A[2]*W),r=A[4]*H;
                         c.fillStyle=A[1];
                         c.fillRect(cx-r*.55,cy-r*.15,r*1.1,r*.75);
                         [-.42,0,.42].forEach(fx=>c.fillRect(cx+fx*r-r*.13,cy-r*.62,r*.26,r*.50));
                         }break;
      case'cle':        {const cx=A[2]*W,cy=A[3]*H+w(A[2]*W),r=A[4]*H;
                         c.strokeStyle=A[1];c.lineWidth=H*.020;
                         c.beginPath();c.arc(cx,cy-r*.55,r*.42,0,Math.PI*2);c.stroke();
                         c.fillStyle=A[1];c.fillRect(cx-r*.09,cy-r*.15,r*.18,r*1.1);
                         c.fillRect(cx-r*.09,cy+r*.60,r*.42,r*.14);
                         }break;
      case'damier':     {const cx=A[2]*W,cy=A[3]*H+w(A[2]*W),r=A[4]*H,n=5,p=r*2/n;
                         for(let i=0;i<n;i++)for(let j=0;j<n;j++){
                           c.fillStyle=(i+j)%2?A[1]:'#FFFFFF';
                           c.fillRect(cx-r+i*p,cy-r+j*p,p,p);}
                         }break;
      case'aigle':      {const cx=A[2]*W,cy=A[3]*H+w(A[2]*W),r=A[4]*H;
                         c.fillStyle=A[1];
                         c.beginPath();c.ellipse(cx,cy+r*.10,r*.16,r*.42,0,0,Math.PI*2);c.fill();
                         [-1,1].forEach(s=>{c.beginPath();
                           c.moveTo(cx+s*r*.10,cy-r*.25);
                           c.quadraticCurveTo(cx+s*r*.95,cy-r*.62,cx+s*r*.80,cy+r*.20);
                           c.quadraticCurveTo(cx+s*r*.45,cy-r*.05,cx+s*r*.10,cy-r*.25);
                           c.closePath();c.fill();
                           c.beginPath();c.ellipse(cx+s*r*.22,cy-r*.42,r*.12,r*.10,0,0,Math.PI*2);c.fill();});
                         }break;
      case'couronne':   {// Les armes du Guatemala : parchemin, fusils et sabres
                         // croises, couronne de laurier, quetzal. Ce qui suit
                         // en garde la LECTURE — une couronne ouverte, des
                         // armes croisees, un parchemin — pas le detail.
                         const cx=A[2]*W,cy=A[3]*H+w(A[2]*W),r=A[4]*H;
                         c.strokeStyle='#6B4423';c.lineWidth=H*.013;   // fusils
                         [-1,1].forEach(s=>{c.beginPath();
                           c.moveTo(cx-s*r*.75,cy+r*.60);c.lineTo(cx+s*r*.75,cy-r*.75);c.stroke();});
                         c.fillStyle='#3B7A57';                         // le quetzal
                         c.beginPath();c.ellipse(cx,cy-r*.30,r*.17,r*.24,0,0,Math.PI*2);c.fill();
                         c.beginPath();c.ellipse(cx-r*.14,cy-r*.52,r*.10,r*.08,0,0,Math.PI*2);c.fill();
                         c.beginPath();                                  // la longue queue
                         c.moveTo(cx+r*.10,cy-r*.12);
                         c.quadraticCurveTo(cx+r*.34,cy+r*.34,cx+r*.12,cy+r*.58);
                         c.quadraticCurveTo(cx+r*.10,cy+r*.20,cx-r*.02,cy-r*.06);
                         c.closePath();c.fill();
                         c.fillStyle='#F2EEE2';                          // le parchemin
                         c.fillRect(cx-r*.72,cy+r*.14,r*1.44,r*.24);
                         c.strokeStyle=A[1];c.lineWidth=H*.016;          // le laurier
                         [-1,1].forEach(s=>{c.beginPath();
                           c.moveTo(cx+s*r*.16,cy+r*.90);
                           c.quadraticCurveTo(cx+s*r*1.15,cy+r*.35,cx+s*r*.62,cy-r*.85);c.stroke();});
                         }break;
      case'soleil':     {const cx=A[2]*W,cy=A[3]*H+w(A[2]*W),r=A[4]*H;
                         c.strokeStyle=A[1];c.lineWidth=H*.011;
                         for(let i=0;i<16;i++){const a=i*Math.PI/8;
                           c.beginPath();c.moveTo(cx+Math.cos(a)*r,cy+Math.sin(a)*r);
                           c.lineTo(cx+Math.cos(a)*r*1.65,cy+Math.sin(a)*r*1.65);c.stroke();}
                         disque(A[1],A[2]*W,A[3]*H,r);
                         }break;
      case'soleilTaiwan':{const cx=A[2]*W,cy=A[3]*H+w(A[2]*W),r=A[4]*H;
                         c.fillStyle=A[1];
                         for(let i=0;i<12;i++){const a=i*Math.PI/6;
                           c.beginPath();c.moveTo(cx+Math.cos(a-.13)*r,cy+Math.sin(a-.13)*r);
                           c.lineTo(cx+Math.cos(a)*r*1.7,cy+Math.sin(a)*r*1.7);
                           c.lineTo(cx+Math.cos(a+.13)*r,cy+Math.sin(a+.13)*r);c.closePath();c.fill();}
                         disque(A[1],A[2]*W,A[3]*H,r);
                         }break;
      case'bauhinia':   {const cx=A[2]*W,cy=A[3]*H+w(A[2]*W),r=A[4]*H;
                         c.fillStyle=A[1];
                         for(let i=0;i<5;i++){const a=i*2*Math.PI/5-Math.PI/2;
                           c.save();c.translate(cx+Math.cos(a)*r*.55,cy+Math.sin(a)*r*.55);
                           c.rotate(a+Math.PI/2);
                           c.beginPath();c.ellipse(0,0,r*.26,r*.52,0,0,Math.PI*2);c.fill();
                           c.restore();}
                         }break;
      case'angkor':     {const cx=A[2]*W,cy=A[3]*H+w(A[2]*W),r=A[4]*H;
                         c.fillStyle=A[1];
                         c.fillRect(cx-r*.85,cy+r*.42,r*1.7,r*.16);
                         [[-.55,.62],[0,1],[.55,.62]].forEach(([fx,fh])=>{
                           c.beginPath();c.moveTo(cx+fx*r,cy-r*fh);
                           c.lineTo(cx+fx*r+r*.22,cy+r*.42);c.lineTo(cx+fx*r-r*.22,cy+r*.42);
                           c.closePath();c.fill();});
                         }break;
      case'cedre':      {const cx=A[2]*W,cy=A[3]*H+w(A[2]*W),r=A[4]*H;
                         c.fillStyle=A[1];
                         c.fillRect(cx-r*.10,cy+r*.30,r*.20,r*.60);
                         [[.95,.62],[.62,.20],[.34,-.24]].forEach(([lg,yy])=>{
                           c.beginPath();c.moveTo(cx,yy*r+cy-r*.55);
                           c.lineTo(cx+lg*r,cy+yy*r+r*.30);c.lineTo(cx-lg*r,cy+yy*r+r*.30);
                           c.closePath();c.fill();});
                         }break;
      case'bouclier':   {const cx=A[3]*W,cy=A[4]*H+w(A[3]*W),r=A[5]*H;
                         c.fillStyle=A[2];c.beginPath();
                         c.ellipse(cx,cy,r*.38,r*.92,0,0,Math.PI*2);c.fill();
                         c.fillStyle=A[1];c.beginPath();
                         c.ellipse(cx,cy,r*.22,r*.62,0,0,Math.PI*2);c.fill();
                         c.strokeStyle=A[2];c.lineWidth=H*.012;
                         [-1,1].forEach(s=>{c.beginPath();
                           c.moveTo(cx+s*r*.30,cy-r*1.15);c.lineTo(cx+s*r*.30,cy+r*1.15);c.stroke();});
                         }break;
      case'embleme':    {const cx=A[2]*W,cy=A[3]*H+w(A[2]*W),r=A[4]*H;
                         c.fillStyle=A[1];
                         c.fillRect(cx-r*.08,cy-r*.9,r*.16,r*1.3);
                         [-1,1].forEach(s=>{c.beginPath();
                           c.moveTo(cx+s*r*.20,cy+r*.4);
                           c.quadraticCurveTo(cx+s*r*.75,cy-r*.2,cx+s*r*.42,cy-r*.75);
                           c.lineTo(cx+s*r*.20,cy-r*.2);c.closePath();c.fill();});
                         }break;
      case'shahada':    {// La chahada et le sabre. Une calligraphie arabe ne se
                         // rend pas a cette taille : deux lignes suggerent le
                         // texte, et c'est dit comme tel.
                         c.fillStyle=A[1];
                         [[.28,.32],[.34,.44]].forEach(([fx,fy])=>
                           c.fillRect(W*fx,H*fy+w(W*fx),W*(1-2*fx),H*.055));
                         c.fillRect(W*.28,H*.66+w(W*.28),W*.44,H*.035);
                         c.beginPath();c.moveTo(W*.72,H*.655+w(W*.72));
                         c.lineTo(W*.78,H*.6775+w(W*.72));c.lineTo(W*.72,H*.70+w(W*.72));
                         c.closePath();c.fill();
                         }break;
      case'hampeGauche':{const f=A[2];
                         A[3].forEach((col,i)=>rect(col,f,1,i/A[3].length,(i+1)/A[3].length));
                         rect(A[1],0,f,0,1);
                         }break;
      case'hampeTrapeze':{const f=A[2];
                         A[3].forEach((col,i)=>hStripe(col,i/A[3].length,(i+1)/A[3].length));
                         c.fillStyle=A[1];
                         const ax=W*f;
                         for(let x=0;x<ax;x+=2){const k=1-x/ax,wv=w(x);
                           c.fillRect(x,H/2-k*H/2+wv,2,k*H);}
                         }break;
      case'dentele':    {// Bahrein et Qatar : une ligne en dents de scie separe
                         // la hampe blanche du champ colore.
                         const f=A[3],n=A[4];
                         hStripe(A[1],0,1);
                         c.fillStyle=A[2];
                         for(let x=Math.floor(W*f);x<W;x+=2){const wv=w(x);c.fillRect(x,wv,2,H);}
                         c.fillStyle=A[2];
                         for(let i=0;i<n;i++){const y0=i*H/n,y1=(i+1)*H/n,wv=w(W*f*.7);
                           c.beginPath();c.moveTo(W*f,y0+wv);
                           c.lineTo(W*f*.62,(y0+y1)/2+wv);c.lineTo(W*f,y1+wv);c.closePath();c.fill();}
                         }break;

      // ── Ceux qui n'entrent dans aucun moule ───────────
      case'unionJack':   unionJack(0,0,W,H);break;
      case'australie':  {unionJack(0,0,W/2,H/2);
                         star5(W*.25,H*.75,H*.11,H*.045,'#FFFFFF');   // etoile du Commonwealth
                         [[.72,.28],[.83,.50],[.72,.74],[.60,.55],[.78,.40]]
                           .forEach(([fx,fy],i)=>star5(fx*W,fy*H,H*(i===4?.035:.055),H*.022,'#FFFFFF'));
                         }break;
      case'ensign':     {hStripe(A[1],0,1);unionJack(0,0,W/2,H/2);
                         disque('#FFFFFF',W*.76,H*.5,H*.19);
                         c.fillStyle='#00247D';
                         for(let i=0;i<3;i++)star5(W*.76,H*(.40+i*.07),H*.030,H*.012,'#00247D');
                         }break;
      case'grece':      {for(let i=0;i<9;i++)hStripe(i%2?'#FFFFFF':'#0D5EAF',i/9,(i+1)/9);
                         const ch=H*5/9;
                         c.fillStyle='#0D5EAF';
                         for(let x=0;x<ch;x+=2){c.fillRect(x,w(x),2,ch);}
                         const e=ch*.20;
                         rect('#FFFFFF',(ch/2-e/2)/W,(ch/2+e/2)/W,0,(ch/H));
                         rect('#FFFFFF',0,ch/W,(ch/2-e/2)/H,(ch/2+e/2)/H);
                         }break;
      case'ySudAfricain':{
                         // Un pairle couche : deux bras verts partant des
                         // angles de la hampe, qui se rejoignent au tiers puis
                         // filent vers le vol en une seule bande. Rouge
                         // au-dessus, bleu au-dessous, et entre les bras un
                         // triangle noir borde d'or.
                         const xf=W*.36,gt=H*.095,fw=H*.038,go=H*.042;
                         for(let x=0;x<W;x+=2){
                           const wv=w(x);
                           if(x<xf){
                             const f=x/xf,yU=H*.5*f,yL=H-H*.5*f;
                             c.fillStyle='#DE3831';c.fillRect(x,wv,2,Math.max(0,yU-gt-fw));
                             c.fillStyle='#002395';c.fillRect(x,yL+gt+fw+wv,2,Math.max(0,H-yL-gt-fw));
                             c.fillStyle='#FFFFFF';
                             c.fillRect(x,yU-gt-fw+wv,2,(gt+fw)*2);
                             c.fillRect(x,yL-gt-fw+wv,2,(gt+fw)*2);
                             c.fillStyle='#007A4D';
                             c.fillRect(x,yU-gt+wv,2,gt*2);c.fillRect(x,yL-gt+wv,2,gt*2);
                             const yA=yU+gt+fw,yB=yL-gt-fw;
                             if(yB>yA){
                               c.fillStyle='#FFB612';c.fillRect(x,yA+wv,2,yB-yA);
                               if(yB-yA>go*2){c.fillStyle='#000000';
                                 c.fillRect(x,yA+go+wv,2,yB-yA-go*2);}
                             }
                           }else{
                             c.fillStyle='#DE3831';c.fillRect(x,wv,2,H*.5-gt-fw);
                             c.fillStyle='#002395';c.fillRect(x,H*.5+gt+fw+wv,2,H*.5-gt-fw);
                             c.fillStyle='#FFFFFF';c.fillRect(x,H*.5-gt-fw+wv,2,(gt+fw)*2);
                             c.fillStyle='#007A4D';c.fillRect(x,H*.5-gt+wv,2,gt*2);
                           }
                         }
                         }break;
      case'benin':      {hStripe('#FCD116',0,.5);hStripe('#E8112D',.5,1);
                         vStripe('#008751',0,.375);
                         }break;
      case'togo':       {for(let i=0;i<5;i++)hStripe(i%2?'#FFFFFF':'#006A4E',i/5,(i+1)/5);
                         const ch=H*3/5;
                         c.fillStyle='#D21034';
                         for(let x=0;x<ch;x+=2){c.fillRect(x,w(x),2,ch);}
                         star5(ch/2,ch/2,H*.13,H*.054,'#FFFFFF');
                         }break;
      case'tanzanie':   {for(let x=0;x<W;x+=2){
                           const wv=w(x),f=x/W,yd=f*H;
                           c.fillStyle='#1EB53A';c.fillRect(x,wv,2,yd);
                           c.fillStyle='#00A3DD';c.fillRect(x,yd+wv,2,H-yd);
                           const g=H*.30;
                           c.fillStyle='#FCD116';c.fillRect(x,yd-g/2+wv,2,g);
                           c.fillStyle='#000000';c.fillRect(x,yd-g*.32+wv,2,g*.64);
                         }
                         }break;
      case'malaisie':   {for(let i=0;i<14;i++)hStripe(i%2?'#FFFFFF':'#CC0001',i/14,(i+1)/14);
                         const cw=W*.5,ch=H*8/14;
                         c.fillStyle='#000066';
                         for(let x=0;x<cw;x+=2){c.fillRect(x,w(x),2,ch);}
                         croissant('#FFCC00',cw*.42,ch*.52,ch*.26,.32);
                         etoileN(cw*.72,ch*.52,ch*.28,ch*.13,14,'#FFCC00');
                         }break;
      case'oman':       {hStripe('#FFFFFF',0,1/3);hStripe('#DB161B',1/3,2/3);hStripe('#008000',2/3,1);
                         rect('#DB161B',0,.28,0,1);
                         c.fillStyle='#FFFFFF';       // le khanjar, stylise
                         const kx=W*.14,ky=H*.24;
                         c.fillRect(kx-W*.012,ky+w(kx),W*.024,H*.20);
                         c.beginPath();c.moveTo(kx-W*.05,ky+H*.20+w(kx));
                         c.quadraticCurveTo(kx,ky+H*.34+w(kx),kx+W*.05,ky+H*.20+w(kx));
                         c.closePath();c.fill();
                         }break;
      case'diagStKitts':{for(let x=0;x<W;x+=2){
                           const wv=w(x),f=x/W,yd=H-f*H;
                           c.fillStyle='#009E49';c.fillRect(x,wv,2,yd);
                           c.fillStyle='#CE1126';c.fillRect(x,yd+wv,2,H-yd);
                           const g=H*.34;
                           c.fillStyle='#FFD100';c.fillRect(x,yd-g/2+wv,2,g);
                           c.fillStyle='#000000';c.fillRect(x,yd-g*.34+wv,2,g*.68);
                         }
                         star5(W*.28,H*.30,H*.085,H*.035,'#FFFFFF');
                         star5(W*.70,H*.70,H*.085,H*.035,'#FFFFFF');
                         }break;
      case'chypre':     {// La silhouette de l'ile en cuivre — corps trapu et
                         // longue queue du Karpas vers le nord-est — puis deux
                         // rameaux d'olivier croises au-dessous.
                         const cx=W*.5,cy=H*.40+w(W*.5),u=H*.13;
                         c.fillStyle='#D57800';c.beginPath();
                         c.moveTo(cx-1.85*u,cy+0.10*u);
                         c.lineTo(cx-1.30*u,cy-0.55*u);
                         c.lineTo(cx-0.30*u,cy-0.42*u);
                         c.lineTo(cx+0.55*u,cy-0.72*u);
                         c.lineTo(cx+1.35*u,cy-0.60*u);
                         c.lineTo(cx+2.35*u,cy-1.15*u);   // la queue du Karpas
                         c.lineTo(cx+2.55*u,cy-0.85*u);
                         c.lineTo(cx+1.45*u,cy-0.20*u);
                         c.lineTo(cx+0.70*u,cy+0.35*u);
                         c.lineTo(cx-0.55*u,cy+0.62*u);
                         c.closePath();c.fill();
                         // Les rameaux : une tige courbe et des feuilles.
                         c.strokeStyle='#4E5B31';c.lineWidth=H*.014;
                         [-1,1].forEach(s=>{
                           c.beginPath();
                           c.moveTo(cx+s*u*0.12,cy+1.35*u);
                           c.quadraticCurveTo(cx+s*u*1.5,cy+1.25*u,cx+s*u*1.9,cy+0.35*u);
                           c.stroke();
                           c.fillStyle='#4E5B31';
                           for(let i=1;i<=4;i++){
                             const k=i/5,px=cx+s*u*(0.12+1.78*k),py=cy+1.35*u-u*1.0*k*k;
                             c.save();c.translate(px,py);c.rotate(s*0.9);
                             c.beginPath();c.ellipse(0,0,u*0.30,u*0.13,0,0,Math.PI*2);c.fill();
                             c.restore();
                           }
                         });
                         }break;
      case'taegeuk':    {const cx=A[1]*W,cy=A[2]*H+w(A[1]*W),r=A[3]*H;
                         c.fillStyle='#CD2E3A';c.beginPath();
                         c.arc(cx,cy,r,Math.PI,0);c.fill();
                         c.fillStyle='#0047A0';c.beginPath();
                         c.arc(cx,cy,r,0,Math.PI);c.fill();
                         c.fillStyle='#CD2E3A';c.beginPath();
                         c.arc(cx-r/2,cy,r/2,0,Math.PI*2);c.fill();
                         c.fillStyle='#0047A0';c.beginPath();
                         c.arc(cx+r/2,cy,r/2,0,Math.PI*2);c.fill();
                         }break;
      case'trigrammes': {c.fillStyle=A[1];
                         // Quatre trigrammes aux angles : 3, 4, 5 et 6 traits.
                         const tri=[[.20,.22,-45,[1,1,1]],[.80,.22,45,[1,0,1]],
                                    [.20,.78,45,[0,1,0]],[.80,.78,-45,[0,0,0]]];
                         tri.forEach(([fx,fy,rot,barres])=>{
                           c.save();c.translate(fx*W,fy*H+w(fx*W));c.rotate(rot*Math.PI/180);
                           barres.forEach((plein,i)=>{
                             const y=(i-1)*H*.042;
                             if(plein){c.fillRect(-H*.075,y-H*.014,H*.15,H*.028);}
                             else{c.fillRect(-H*.075,y-H*.014,H*.062,H*.028);
                                  c.fillRect(H*.013,y-H*.014,H*.062,H*.028);}
                           });
                           c.restore();});
                         }break;
    }
  }

  // L'Union Jack sert trois fois : le Royaume-Uni en plein, l'Australie
  // et les Caimans en canton. Une seule fonction, parametree par le
  // rectangle qui l'accueille.
  function unionJack(x0,y0,ww,hh){
    const dy=(x)=>w(x);
    c.save();c.beginPath();
    for(let x=x0;x<x0+ww;x+=2){c.rect(x,y0+dy(x),2,hh);}
    c.clip();
    c.fillStyle='#00247D';c.fillRect(x0-4,y0-hh,ww+8,hh*3);
    const diag=(col,lw)=>{c.strokeStyle=col;c.lineWidth=lw;
      c.beginPath();c.moveTo(x0,y0);c.lineTo(x0+ww,y0+hh);
      c.moveTo(x0+ww,y0);c.lineTo(x0,y0+hh);c.stroke();};
    diag('#FFFFFF',hh*.20);
    diag('#CF142B',hh*.09);
    c.fillStyle='#FFFFFF';
    c.fillRect(x0,y0+hh*.5-hh*.17,ww,hh*.34);
    c.fillRect(x0+ww*.5-ww*.10,y0,ww*.20,hh);
    c.fillStyle='#CF142B';
    c.fillRect(x0,y0+hh*.5-hh*.09,ww,hh*.18);
    c.fillRect(x0+ww*.5-ww*.055,y0,ww*.11,hh);
    c.restore();
  }

  // Les identifiants de marche renvoient au pays qu'ils designent.
  id=FLAGS_ALIAS[id]||id;

  const spec=FLAGS_SPEC[id];
  if(spec){
    bandes(spec);
    (spec.o||[]).forEach(figure);
    // Les tres complexes gardent une fonction dediee, appelee par `o`.
    return;
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
var FLAGS_DESSINES = [
                      'albania','andorra','argentina','armenia','aruba',
                      'australia','austria','azerbaijan','bahrain','barbados',
                      'belgium','benin','botswana','brazil','bulgaria',
                      'burkina','cambodia','cameroon','canada','canada_mkt',
                      'canaries','caymanisles','chile','china','china_mkt',
                      'colombia','costarica','croatia','cuba','cyprus',
                      'czech','dominican','ecuador','egypt','ethiopia',
                      'eu_mkt','france','france_mkt','germany','ghana',
                      'gibraltar','greece','guatemala','guinea','honduras',
                      'hongkong','india','indonesia','iran','israel',
                      'italy','ivorycoast','jamaica','japan','japan_mkt',
                      'kenya','kuwait','lebanon','luxembourg','malaysia',
                      'mali','mexico','monaco','morocco','netherlands',
                      'nicaragua','nigeria','oman','panama','paraguay',
                      'peru','philippines','poland','portugal','qatar',
                      'romania','russia','russia_mkt','saudiarabia','senegal',
                      'serbia','singapore','southafrica','southkorea','spain',
                      'stkitts','stmartin','switz_mkt','switzerland','taiwan',
                      'tanzania','thailand','togo','turkey','uae',
                      'uae_mkt','uk','uk_mkt','ukraine','usa',
                      'usa_mkt','venezuela','vietnam'];

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


