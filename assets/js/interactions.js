/* interactions.js */
// interactions.js — Zoom controls, mouse/touch events
// ════════════════════════════════════════════════════════

// ── Zoom buttons ────────────────────────────────────────
document.getElementById('zIn').onclick    = () => { zoomScale = Math.min(zoomScale + .2, 3); };
document.getElementById('zOut').onclick   = () => { zoomScale = Math.max(zoomScale - .2, .4); };
document.getElementById('zReset').onclick = () => { zoomScale = 1; };
globe.addEventListener('wheel', e => {
  e.preventDefault();
  zoomScale = Math.max(.4, Math.min(3, zoomScale - e.deltaY * .0008));
}, { passive: false });

// ── Shared hit-test ─────────────────────────────────────
function hitTest(clientX, clientY) {
  // Returns { type:'country'|'market'|'lounge', data } or null
  let hit = null;
  const R = getR();
  COUNTRIES.forEach(c => {
    if (hit) return;
    const p  = ll2xyz(c.lat, c.lon, R);
    const pj = proj(p.x, p.y, p.z);
    if (pj.z < -10) return;
    if (Math.hypot(clientX - pj.x, clientY - pj.y) < 32)
      hit = { type: 'country', data: c };
  });
  if (!hit && showMarkets) {
    MARKETS.forEach(m => {
      if (hit) return;
      const p  = ll2xyz(m.lat, m.lon, R);
      const pj = proj(p.x, p.y, p.z);
      if (pj.z < -10) return;
      if (Math.hypot(clientX - pj.x, clientY - pj.y) < 28)
        hit = { type: 'market', data: m };
    });
  }
  if (!hit && showLounges && typeof LOUNGE_COUNTRIES !== 'undefined') {
    LOUNGE_COUNTRIES.forEach(lc => {
      if (hit) return;
      const p  = ll2xyz(lc.lat, lc.lon, R);
      const pj = proj(p.x, p.y, p.z);
      if (pj.z < -10) return;
      if (Math.hypot(clientX - pj.x, clientY - pj.y) < 32)
        hit = { type: 'lounge', data: lc };
    });
  }
  return hit;
}

function handleSelect(clientX, clientY) {
  const hit = hitTest(clientX, clientY);
  if (!hit) return false;

  // Use mobile-aware wrappers if available (set by app.js)
  // Falls back to direct calls for desktop
  const _openPanel = window._mobileOpenPanel || openPanel;
  const _openLex   = window._mobileOpenLex   || openLex;
  const _flyTo     = window._mobileFlyTo     || flyToCountry;

  if (hit.type === 'country') {
    var c = hit.data;
    var isProducer = !!c.tier; // tier défini = pays producteur (major/notable/emerging)

    if (isProducer) {
      // Pays producteur → panneaux infos + marques + lexique
      selCountry = c; selMarket = null; selLoungeCountry = null;
      _flyTo(c);
      _openPanel(c);
      _openLex(c);
    } else {
      // Pays non-producteur → uniquement panneau lounges
      selLoungeCountry = c; selCountry = null; selMarket = null;
      _flyTo(c);
      // Mobile ou desktop : ouvrir lounge-panel
      // openLoungePanel gère déjà la fermeture des autres panneaux
      if (typeof openLoungePanel === 'function') openLoungePanel(c);
    }
  } else if (hit.type === 'market') {
    selMarket = hit.data; selCountry = null; selLoungeCountry = null;
    _flyTo(hit.data);
    openMarketPanel(hit.data);
  } else if (hit.type === 'lounge') {
    selLoungeCountry = hit.data; selCountry = null; selMarket = null;
    _flyTo(hit.data);
    if (typeof openLoungePanelForCountry === 'function') openLoungePanelForCountry(hit.data);
  }
  return true;
}

// ── Mouse drag + click ───────────────────────────────────
var _mouseMoved = false;

// Déclenche l'inertie au relâché si le geste était un mouvement récent.
function _maybeInertia() {
  if (_reduceMotion) { _inertia = false; return; }
  if (performance.now() - _lastMoveT > 90) return;   // pause avant le lâcher → pas de lancer
  var sp = Math.hypot(velX, velY);
  if (sp < 0.0009) { _inertia = false; return; }
  var cap = 0.06;                                     // vitesse max (évite un spin fou)
  if (sp > cap) { velX *= cap / sp; velY *= cap / sp; }
  _inertia = true;
}

globe.addEventListener('mousedown', e => {
  drag = true; autoRot = false; animating = false; _inertia = false;
  lastX = e.clientX; lastY = e.clientY;
  _mouseMoved = false;
});

window.addEventListener('mousemove', e => {
  if (drag) {
    const dx = e.clientX - lastX, dy = e.clientY - lastY;
    if (Math.abs(dx) > 2 || Math.abs(dy) > 2) _mouseMoved = true;
    rotY += dx * .007; rotX += dy * .007;
    rotX = Math.max(-Math.PI / 2, Math.min(Math.PI / 2, rotX));
    lastX = e.clientX; lastY = e.clientY;
    targetX = rotX; targetY = rotY;
    velY = dx * .007; velX = dy * .007; _lastMoveT = performance.now();
  }

  // Hover detection (desktop only)
  hoverCountry = null; hoverMarket = null; hoverLoungeCountry = null;
  const hit = hitTest(e.clientX, e.clientY);
  if (hit) {
    if      (hit.type === 'country') hoverCountry       = hit.data;
    else if (hit.type === 'market')  hoverMarket        = hit.data;
    else if (hit.type === 'lounge')  hoverLoungeCountry = hit.data;
    const label = hit.type === 'country'
      ? hit.data.flag + ' ' + hit.data.name.toUpperCase()
      : hit.type === 'market'
        ? hit.data.flag + ' ' + hit.data.name.toUpperCase() + ' — Marché #' + hit.data.rank
        : hit.data.flag + ' ' + hit.data.name.toUpperCase() + ' — Caves & Lounges';
    tip.style.opacity = '1';
    tip.style.left = (e.clientX + 14) + 'px';
    tip.style.top  = (e.clientY - 16) + 'px';
    tip.textContent = label;
    globe.style.cursor = 'pointer';
  } else {
    tip.style.opacity  = '0';
    globe.style.cursor = drag ? 'grabbing' : 'grab';
  }
});

window.addEventListener('mouseup', () => { drag = false; _maybeInertia(); });

globe.addEventListener('click', e => {
  if (_mouseMoved) return; // was a drag, not a click
  // Safari fires click ~300ms after touchend — suppress to avoid double selection
  if (Date.now() - _lastTouchEnd < 500) return;
  handleSelect(e.clientX, e.clientY);
});

// ── Touch ───────────────────────────────────────────────
// Tracks touch to distinguish tap from drag
var _touchStartX = 0, _touchStartY = 0, _touchMoved = false;

// Safari fires both touchend AND click — track last touch to suppress duplicate click
var _lastTouchEnd = 0;

globe.addEventListener('touchstart', e => {
  drag = true; autoRot = false; animating = false; _inertia = false;
  lastX = _touchStartX = e.touches[0].clientX;
  lastY = _touchStartY = e.touches[0].clientY;
  _touchMoved = false;
}, { passive: true });

globe.addEventListener('touchmove', e => {
  if (!drag) return;
  const dx = e.touches[0].clientX - lastX;
  const dy = e.touches[0].clientY - lastY;
  // Only count as drag if moved > 8px (filter accidental micro-movement)
  if (Math.abs(e.touches[0].clientX - _touchStartX) > 8 ||
      Math.abs(e.touches[0].clientY - _touchStartY) > 8) {
    _touchMoved = true;
  }
  rotY += dx * .007;
  rotX += dy * .007;
  rotX = Math.max(-Math.PI / 2, Math.min(Math.PI / 2, rotX));
  lastX = e.touches[0].clientX;
  lastY = e.touches[0].clientY;
  targetX = rotX; targetY = rotY;
  velY = dx * .007; velX = dy * .007; _lastMoveT = performance.now();
  e.preventDefault();
}, { passive: false });

globe.addEventListener('touchend', e => {
  drag = false;
  _lastTouchEnd = Date.now(); // suppress subsequent click event (Safari double-fire)
  _maybeInertia();            // momentum si le doigt était en mouvement au lâcher

  if (_touchMoved) return; // was a drag — ignore

  // It's a TAP — detect what was tapped
  const touch = e.changedTouches[0];
  const tapped = handleSelect(touch.clientX, touch.clientY);

  // Resume auto-rotation only if nothing was tapped
  if (!tapped) {
    setTimeout(() => { autoRot = true; }, 3000);
  }
});

// ── Panel close ──────────────────────────────────────────
function closePanels() {
  ['panel','lex','lounge-panel'].forEach(id => {
    const el = document.getElementById(id);
    if (el) { el.classList.remove('open'); el.setAttribute('aria-hidden','true'); }
  });
  document.getElementById('flag-bg').classList.remove('visible');
  selCountry = null; selMarket = null;
  ['mnav-lex','mnav-panel','mnav-lounge'].forEach(id => {
    const b = document.getElementById(id);
    if (b) b.classList.remove('has-content');
  });
  if (typeof switchMobileTab === 'function') switchMobileTab('globe');
  setTimeout(() => { autoRot = true; }, 1500);
}

document.getElementById('panelClose').onclick = closePanels;
document.getElementById('lexClose').onclick   = () => {
  document.getElementById('lex').classList.remove('open');
  document.getElementById('lex').setAttribute('aria-hidden', 'true');
  if (typeof switchMobileTab === 'function') switchMobileTab('globe');
};




