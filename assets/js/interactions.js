/* interactions.js */
// interactions.js — Zoom controls, mouse/touch events
// ════════════════════════════════════════════════════════

// ── Zoom buttons ────────────────────────────────────────
document.getElementById('zIn').onclick    = () => { zoomScale = Math.min(zoomScale + .2, 3); };
document.getElementById('zOut').onclick   = () => { zoomScale = Math.max(zoomScale - .2, .4); };
document.getElementById('zReset').onclick = () => { zoomScale = 1; };
// ── Zoom molette centré sur le curseur ──────────────────
// Le globe est toujours dessiné au centre de l'écran : « zoomer vers le
// curseur » revient donc à garder sous le pointeur le point géographique
// qui s'y trouvait. On dé-projette ce point, puis on résout la rotation
// (rotX, rotY) qui le ramène exactement à la même position écran après
// le changement de rayon. Repli silencieux sur le zoom centré classique
// si le curseur est hors du globe ou si aucune rotation valide n'existe.
function _zoomAtCursor(clientX, clientY, newZoom) {
  var R  = getR();
  var px = clientX - W / 2, py = H / 2 - clientY;   // repère de proj()
  var d2 = px * px + py * py;
  if (d2 > R * R * 0.98) return false;              // hors du disque / au ras du limbe

  // Dé-projection : point écran → direction dans le repère du globe
  var pz = Math.sqrt(Math.max(0, R * R - d2));
  var cx = Math.cos(rotX), sx = Math.sin(rotX);
  var cy = Math.cos(rotY), sy = Math.sin(rotY);
  var gx = px * cy - pz * sy;
  var z1 = px * sy + pz * cy;
  var gy =  py * cx + z1 * sx;
  var gz = -py * sx + z1 * cx;
  var ux = gx / R, uy = gy / R, uz = gz / R;        // vecteur unitaire

  // Rayon après zoom (getR() dépend de zoomScale)
  var keep = zoomScale; zoomScale = newZoom;
  var R2 = getR(); zoomScale = keep;
  if (d2 > R2 * R2 * 0.98) return false;            // le point sortirait du disque

  // Direction cible : même position écran, sur la sphère de rayon R2
  var vx = px / R2, vy = py / R2, vz = Math.sqrt(Math.max(0, R2 * R2 - d2)) / R2;

  // rotX' tel que  uy·cos(rotX') − uz·sin(rotX') = vy
  var M = Math.hypot(uy, uz);
  if (M < 1e-9 || Math.abs(vy) > M) return false;
  var phi = Math.atan2(uz, uy);
  var a   = Math.acos(Math.max(-1, Math.min(1, vy / M)));
  var norm = function (t) { while (t > Math.PI) t -= 2 * Math.PI; while (t < -Math.PI) t += 2 * Math.PI; return t; };
  var c1 = norm(-phi + a), c2 = norm(-phi - a);     // deux branches
  var nrx = Math.abs(norm(c1 - rotX)) <= Math.abs(norm(c2 - rotX)) ? c1 : c2;
  if (nrx > Math.PI / 2 || nrx < -Math.PI / 2) return false;  // hors des limites de l'app

  // rotY' : rotation amenant (ux, z1') sur (vx, vz)
  var nz1 = uy * Math.sin(nrx) + uz * Math.cos(nrx);
  var nry = Math.atan2(nz1, ux) - Math.atan2(vz, vx);
  if (!isFinite(nrx) || !isFinite(nry)) return false;

  rotX = nrx; rotY = nry;
  targetX = rotX; targetY = rotY;                   // pas de lissage résiduel
  if (typeof _inertia !== 'undefined') _inertia = false;
  return true;
}

globe.addEventListener('wheel', e => {
  e.preventDefault();
  var next = Math.max(.4, Math.min(3, zoomScale - e.deltaY * .0008));
  if (next === zoomScale) return;
  _zoomAtCursor(e.clientX, e.clientY, next);        // repli géré à l'intérieur
  zoomScale = next;
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
  return selectEntity(hit.type, hit.data);
}

/**
 * Ouvre les panneaux correspondant a une entite du globe.
 * Partage entre le clic/tap sur le globe et la navigation au clavier
 * (assets/js/a11y-globe.js), pour un comportement strictement identique.
 * @param {'country'|'market'|'lounge'} type
 */
function selectEntity(type, data) {
  const hit = { type: type, data: data };
  if (!hit.data) return false;

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
  //
  // Ce gestionnaire vit sur `window` et non sur le canvas, et il le faut :
  // un glisser doit continuer a suivre la souris quand elle sort du globe,
  // sinon la rotation se fige des qu'on deborde. Mais le SURVOL, lui, n'a
  // rien a faire ailleurs que sur le globe : hitTest() ne connait que des
  // coordonnees d'ecran, il repondait donc aussi bien sous un panneau, et
  // l'infobulle decrivait un marqueur cache derriere l'interface.
  //
  // `e.target` est l'element reellement survole — le gestionnaire recoit
  // l'evenement par propagation. Les surfaces en pointer-events:none
  // (l'infobulle elle-meme, le voile de fete nationale) n'y apparaissent
  // jamais et ne masquent donc pas le globe.
  var surLeGlobe = (e.target === globe);
  hoverCountry = null; hoverMarket = null; hoverLoungeCountry = null;
  const hit = surLeGlobe ? hitTest(e.clientX, e.clientY) : null;
  if (hit) {
    if      (hit.type === 'country') hoverCountry       = hit.data;
    else if (hit.type === 'market')  hoverMarket        = hit.data;
    else if (hit.type === 'lounge')  hoverLoungeCountry = hit.data;
    const label = hit.type === 'country'
      ? hit.data.flag + ' ' + hit.data.name.toUpperCase()
      : hit.type === 'market'
        ? hit.data.flag + ' ' + hit.data.name.toUpperCase() + ' ' + t('tip_market').replace('{n}', hit.data.rank)
        : hit.data.flag + ' ' + hit.data.name.toUpperCase() + ' ' + t('tip_lounges');
    // Le texte doit etre pose avant la mesure, sinon la largeur est
    // celle de l'infobulle precedente.
    tip.textContent = label;
    // Maintenir l'infobulle dans la fenetre : pres d'un bord elle
    // debordait et se retrouvait coupee — d'autant plus en arabe, ou
    // elle part vers la gauche.
    var lr = tip.getBoundingClientRect();
    var gx = e.clientX + 14;
    if (gx + lr.width > window.innerWidth - 8) gx = e.clientX - 14 - lr.width;
    if (gx < 8) gx = 8;
    var gy = Math.max(8, Math.min(e.clientY - 16, window.innerHeight - lr.height - 8));
    tip.style.left = gx + 'px';
    tip.style.top  = gy + 'px';
    tip.classList.add('tip-on');
    tip.setAttribute('aria-hidden', 'false');
    globe.style.cursor = 'pointer';
  } else {
    tip.classList.remove('tip-on');
    tip.setAttribute('aria-hidden', 'true');
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
  // Retour a l'onglet Globe sur mobile. C'est VITAL, pas cosmetique :
  // la boucle de rendu se met en pause hors de cet onglet (_globeHidden)
  // et seul switchMobileTab('globe') la relance. Sans cet appel, fermer
  // un panneau par sa croix laissait le globe FIGE — il reapparaissait
  // immobile, et l'utilisateur croyait l'application plantee.
  if (typeof switchMobileTab === 'function') switchMobileTab('globe');
  // Animations du drapeau et horloge de la fiche : sans arret, trois
  // boucles continuaient de peindre un canvas plein ecran invisible.
  if (window.stopFlags) window.stopFlags();
  if (window.ficheArreter) window.ficheArreter();
  setTimeout(() => { autoRot = true; }, 1500);
}

document.getElementById('panelClose').onclick = closePanels;
document.getElementById('lexClose').onclick   = () => {
  document.getElementById('lex').classList.remove('open');
  document.getElementById('lex').setAttribute('aria-hidden', 'true');
  if (typeof switchMobileTab === 'function') switchMobileTab('globe');
};




