/* animation.js *//* animation.js */
// animation.js — flyToCountry, render loop, compass, zoom
function flyToCountry(c){
  const phi = (90 - c.lat) * Math.PI / 180;
  const theta = (c.lon + 180) * Math.PI / 180;
  // Raw 3D coords (unit sphere)
  const px = -Math.sin(phi) * Math.cos(theta);
  const py =  Math.cos(phi);
  const pz =  Math.sin(phi) * Math.sin(theta);

  // Step 1: rotX target = -lat (centers latitude vertically)
  const targetRotX = Math.max(-Math.PI/2, Math.min(Math.PI/2, -c.lat * Math.PI / 180));

  // Step 2: compute z1 = py*sin(rotX) + pz*cos(rotX)  after rotX applied
  const A = py * Math.sin(targetRotX) + pz * Math.cos(targetRotX);

  // Step 3: rotY = atan2(-px, A)  → x1 = 0, country at screen center
  let targetRotY = Math.atan2(-px, A);

  // Shortest arc from current rotY
  let dY = targetRotY - rotY;
  while(dY >  Math.PI) dY -= 2*Math.PI;
  while(dY < -Math.PI) dY += 2*Math.PI;

  animFromX = rotX; animFromY = rotY;
  animToX = targetRotX; animToY = rotY + dY;
  animStartTime = performance.now(); animating = true; autoRot = false;
}

var _loopPaused = false;
// Le globe est-il masqué ? (mobile, onglet ≠ globe) → inutile de dessiner
function _globeHidden(){
  return document.body.classList.contains('mobile-mode')
      && typeof mobileActiveTab !== 'undefined' && mobileActiveTab !== 'globe';
}
function _resumeGlobe(){ if(_loopPaused){ _loopPaused = false; loop(); } }

function loop(){
  // Pause : ne pas consommer de CPU quand le globe n'est pas visible
  if(_globeHidden()){ _loopPaused = true; return; }
  // Smooth animation to country
  if(animating){
    const elapsed=performance.now()-animStartTime;
    const t=Math.min(1,elapsed/animDuration);
    const e=easeInOut(t);
    rotX=animFromX+(animToX-animFromX)*e;
    rotY=animFromY+(animToY-animFromY)*e;
    targetX=rotX;targetY=rotY;
    if(t>=1)animating=false;
  } else if(_reduceMotion){
    // reduced-motion : gel total (ni rotation auto, ni inertie résiduelle).
    // Le drag (mousemove) et flyTo (branche animating) restent opérants.
    targetX=rotX; targetY=rotY;
  } else if(_inertia && !drag){
    // Momentum : on prolonge la rotation avec la vélocité du drag, en décroissant.
    rotY += velY; rotX += velX;
    rotX = Math.max(-Math.PI/2, Math.min(Math.PI/2, rotX));
    velX *= 0.94; velY *= 0.94;
    targetX = rotX; targetY = rotY;
    if(Math.hypot(velX, velY) < 0.00018) _inertia = false;
  } else {
    if(autoRot&&!drag)rotY+=.0008;
    rotX+=(targetX-rotX)*.08;rotY+=(targetY-rotY)*.08;
    if(!autoRot){targetX=rotX;targetY=rotY;}
  }
  drawGlobe();
  updateZoomUI();
  requestAnimationFrame(loop);
}
// ── startGlobeLoop : appelé par data.loader.js après chargement ──
function startGlobeLoop() {
  loop();
}
// ── Initialisation DOM (overlay + globe) ─────────────────
function _initDOM() {
  // Cacher l'overlay — fonctionne que le DOM soit prêt ou non
  var ov  = document.getElementById('loading-overlay');
  var msg = document.getElementById('loading-msg');
  if (msg) msg.textContent = 'Globe prêt ✓';
  if (ov) {
    ov.style.transition = 'opacity 0.4s';
    ov.style.opacity    = '0';
    setTimeout(function() { ov.style.display = 'none'; }, 420);
  }

  // Fermer tous les panneaux
  ['panel','lex','lounge-panel','bmodal','contrib-modal','search-overlay'].forEach(function(id) {
    var el = document.getElementById(id);
    if (!el) return;
    el.classList.remove('open');
    el.setAttribute('aria-hidden', 'true');
  });

  // Reset état
  var flagBg = document.getElementById('flag-bg');
  if (flagBg) flagBg.classList.remove('visible');
  if (typeof selCountry       !== 'undefined') selCountry       = null;
  if (typeof selMarket        !== 'undefined') selMarket        = null;
  if (typeof selLoungeCountry !== 'undefined') selLoungeCountry = null;
  if (typeof switchMobileTab  === 'function')  switchMobileTab('globe');
  ['mnav-lex','mnav-panel','mnav-lounge'].forEach(function(id) {
    var btn = document.getElementById(id);
    if (btn) btn.classList.remove('has-content');
  });
}

// Démarrage immédiat si données inline présentes
if (typeof COUNTRIES !== 'undefined' && COUNTRIES.length > 0) {
  startGlobeLoop();
  // Cacher l'overlay dès que le DOM est disponible
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', _initDOM);
  } else {
    // DOM déjà prêt (script chargé après DOMContentLoaded)
    _initDOM();
  }
}

// ════ COMPASS ════

// ════ ZOOM UI ════
function updateZoomUI(){
  const pct=Math.round(zoomScale*100);
  document.getElementById('zoom-lbl').textContent=pct+'%';
  const minZ=0.4,maxZ=3;
  const frac=(zoomScale-minZ)/(maxZ-minZ);
  const h=Math.max(4,Math.round(60*frac));
  document.getElementById('zoom-thumb').style.height=h+'px';
}



