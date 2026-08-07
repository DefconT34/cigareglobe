/* app.js */
// app.js — Bootstrap, mobile nav, lounge panel, language
// Loaded LAST.
// ════════════════════════════════════════════════════════

// ── Échappement (contenu potentiellement communautaire) ──
// Les fiches d'établissement mélangent données vérifiées et
// contributions de membres : tout ce qui est injecté en HTML doit être
// échappé, en particulier à l'intérieur d'un attribut.
function _escHtml(s) {
  return String(s == null ? '' : s).replace(/[&<>"']/g, function (c) {
    return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
  });
}
function _escAttr(s) { return _escHtml(s); }

// N'autorise que http(s) : bloque javascript:, data:, vbscript:…
function _safeUrl(u) {
  if (!u) return '';
  var s = String(u).trim();
  return /^https?:\/\//i.test(s) ? s : '';
}

// ── Helpers ───────────────────────────────────────────────
function isMobile() { return window.innerWidth <= 640; }

// ── Mobile hamburger ─────────────────────────────────────
var _mMenuBtn = document.getElementById('mobile-menu-btn');
var _mMenu    = document.getElementById('mobile-menu');

function closeMobileMenu() {
  if (_mMenu) _mMenu.classList.remove('open');
  if (_mMenuBtn) _mMenuBtn.setAttribute('aria-expanded', 'false');
}

if (_mMenuBtn) {
  _mMenuBtn.addEventListener('click', function(e) {
    e.stopPropagation();
    var isOpen = _mMenu.classList.toggle('open');
    _mMenuBtn.setAttribute('aria-expanded', String(isOpen));
  });
}

document.addEventListener('click', function(e) {
  if (_mMenu && _mMenu.classList.contains('open') &&
      !_mMenu.contains(e.target) && _mMenuBtn && !_mMenuBtn.contains(e.target)) {
    closeMobileMenu();
  }
});

// close menu when mobile lang/theme picked
document.querySelectorAll('.mlang-btn').forEach(function(btn) {
  btn.addEventListener('click', function() { closeMobileMenu(); });
});

// ── Theme ────────────────────────────────────────────────
function applyTheme(theme) {
  document.documentElement.setAttribute('data-theme', theme);
  if (typeof invalidateThemeColors === 'function') invalidateThemeColors();
  document.querySelectorAll('.theme-btn,.mtheme-btn').forEach(function(b) {
    b.classList.toggle('active', b.getAttribute('data-theme') === theme);
  });
}
document.querySelectorAll('.theme-btn,.mtheme-btn').forEach(function(btn) {
  btn.addEventListener('click', function() {
    applyTheme(btn.getAttribute('data-theme'));
    closeMobileMenu();
  });
});

// ── Mobile bottom nav ─────────────────────────────────────
var mobileActiveTab = 'globe';
var ALL_TABS = ['globe', 'lex', 'panel', 'lounge'];

function switchMobileTab(tab) {
  if (!isMobile()) return;
  mobileActiveTab = tab;
  // Relancer la boucle du globe si on y revient (elle se met en pause ailleurs)
  if (tab === 'globe' && typeof _resumeGlobe === 'function') _resumeGlobe();
  ['lex', 'panel', 'lounge-panel'].forEach(function(id) {
    var el = document.getElementById(id);
    if (el) { el.classList.remove('open'); el.setAttribute('aria-hidden', 'true'); }
  });
  var target = tab === 'lounge' ? 'lounge-panel' : tab;
  if (tab !== 'globe') {
    var el = document.getElementById(target);
    if (el) { el.classList.add('open'); el.setAttribute('aria-hidden', 'false'); }
  }
  document.querySelectorAll('.mnav-tab').forEach(function(t) {
    t.classList.toggle('active', t.dataset.tab === tab);
    if (t.dataset.tab === tab) t.classList.remove('has-content');
  });
}

function buildMobileNav() {
  if (document.getElementById('mobile-nav')) return;
  var nav = document.createElement('nav');
  nav.id = 'mobile-nav';
  nav.setAttribute('role', 'navigation');
  nav.setAttribute('aria-label', 'Navigation mobile');
  nav.innerHTML =
    '<button class="mnav-tab active" data-tab="globe"><span class="mnav-icon">🌍</span><span class="mnav-lbl">Globe</span></button>' +
    '<button class="mnav-tab" data-tab="lex" id="mnav-lex"><span class="mnav-icon">📊</span><span class="mnav-lbl">Infos</span></button>' +
    '<button class="mnav-tab" data-tab="panel" id="mnav-panel"><span class="mnav-icon">🗺</span><span class="mnav-lbl">Marques</span></button>' +
    '<button class="mnav-tab" data-tab="lounge" id="mnav-lounge"><span class="mnav-icon">🥃</span><span class="mnav-lbl">Lounges</span></button>';
  document.body.appendChild(nav);
  nav.querySelectorAll('.mnav-tab').forEach(function(btn) {
    btn.addEventListener('click', function() { switchMobileTab(btn.dataset.tab); });
  });
}

function setMobileMode(on) {
  document.body.classList.toggle('mobile-mode', on);
  buildMobileNav();
  var nav = document.getElementById('mobile-nav');
  if (nav) nav.style.display = on ? 'flex' : 'none';
  if (on) {
    ['lex','panel','lounge-panel'].forEach(function(id) {
      var el = document.getElementById(id);
      if (el) el.classList.remove('open');
    });
    mobileActiveTab = 'globe';
  } else {
    ['lex','panel','lounge-panel'].forEach(function(id) {
      var el = document.getElementById(id);
      if (el) el.classList.remove('open');
    });
  }
}

var _wasMobile = null;
function onResize() {
  var mobile = isMobile();
  if (mobile !== _wasMobile) { _wasMobile = mobile; setMobileMode(mobile); }
}
window.addEventListener('resize', onResize);
onResize();

// ══════════════════════════════════════════════════════
// LOUNGE PANEL — fills #lounge-panel on RIGHT side
// On DESKTOP: opens as right sidebar (replaces/stacks over .panel)
// On MOBILE:  opens via 🥃 tab
// ══════════════════════════════════════════════════════

// Cache des notes IP de l'utilisateur courant
var _myRatings = null; // {loungeId: rating} chargé depuis ?action=my_ratings

function _loadMyRatings(callback) {
  // Cache hit — appeler immédiatement
  if (_myRatings !== null) { if (callback) callback(_myRatings); return; }
  // API non configurée — continuer sans notation
  if (typeof API_BASE === 'undefined' || !API_BASE) {
    _myRatings = {};
    if (callback) callback(_myRatings);
    return;
  }
  fetch(API_BASE + '?action=my_ratings', { credentials: 'include' })
    .then(function(r) { return r.ok ? r.json() : {}; })
    .then(function(d) { _myRatings = (d && d.ratings) ? d.ratings : {}; })
    .catch(function()  { _myRatings = {}; })
    .finally(function() { if (callback) callback(_myRatings); });
}
// Réinitialise le cache des notes (appelé par account.js à la connexion/déconnexion)
window._resetMyRatings = function() { _myRatings = null; };

// Enrichir les lounges avec my_rating depuis le cache
function _enrichWithMyRatings(list) {
  if (!_myRatings) return list;
  return list.map(function(l) {
    if (l.id && _myRatings[l.id]) l.my_rating = _myRatings[l.id];
    return l;
  });
}

function openLoungePanel(c, background) {
  var el = document.getElementById('lounge-panel');
  if (!el) return;

  // Pas de celebration quand le panneau s'ouvre en arriere-plan : la
  // fete salue un clic de l'utilisateur, pas un rendu preparatoire.
  if (!background && window.celebrerFeteAuClic) window.celebrerFeteAuClic(c);

  // Reciproque de _fillPanelLounges : on retire l'extrait de la fiche pays
  // pour ne jamais avoir deux fois les memes cartes (identifiants uniques).
  var excerpt = document.getElementById('panel-lounges');
  if (excerpt) excerpt.innerHTML = '';

  document.getElementById('lFlag').textContent   = c.flag || '';
  document.getElementById('lName').textContent   = c.name || '';
  document.getElementById('lRegion').textContent = c.region || 'Caves & Lounges';

  var cvs = document.getElementById('lounge-flag-cvs');
  if (cvs && typeof drawFlag === 'function') {
    if (cvs._animId) cancelAnimationFrame(cvs._animId);
    var lt = 0;
    (function anim() { drawFlag(cvs, c.id, lt++); cvs._animId = requestAnimationFrame(anim); })();
  }

  // Show panel immediately (before data arrives)
  if (!background) {
    el.classList.add('open');
    el.setAttribute('aria-hidden', 'false');
    if (!isMobile()) {
      var panelEl = document.getElementById('panel');
      var lexEl   = document.getElementById('lex');
      if (panelEl) panelEl.classList.remove('open');
      if (lexEl)   lexEl.classList.remove('open');
    } else {
      switchMobileTab('lounge');
      var lBtn = document.getElementById('mnav-lounge');
      if (lBtn) lBtn.classList.add('has-content');
    }
  }

  var body = document.getElementById('loungeBody');

  // Force API pour données enrichies (id SQL, hours, maps_url, etc.)

  // Show spinner while loading
  body.innerHTML =
    '<div style="padding:40px;text-align:center;color:var(--text2);' +
    'font-family:Cinzel,serif;font-size:10px;letter-spacing:.15em">'+t('loading_spinner')+'</div>';

  window.loadLounges(c.id)
    .then(function(list) {
      _loadMyRatings(function() {
        // Le chargement est asynchrone : entre-temps l'utilisateur a pu
        // revenir a la fiche pays. Sans cette garde, un rendu tardif
        // repeuplerait un panneau ferme et dupliquerait les cartes.
        if (!background && !el.classList.contains('open')) { body.innerHTML = ''; return; }
        list = _enrichWithMyRatings(list);
        _renderLoungeCards(c, list, body);
        if (typeof injectContribButton === 'function') injectContribButton(c.id);
      });
    })
    .catch(function() {
      body.innerHTML = '<div style="padding:20px;color:#e55">'+t('error_loading')+'</div>';
    });
}

function _renderLoungeCards(c, list, body, opts) {
  opts = opts || {};
  if (!list || !list.length) {
    body.innerHTML =
      '<div class="no-lounge-banner">' +
        '<div class="no-lounge-icon">🔎</div>' +
        '<div class="no-lounge-title">'+t('no_lounge_title')+'</div>' +
        '<div class="no-lounge-sub">'+t('no_lounge_sub')+'</div>' +
      '</div>';
    return;
  }
  var cards = list.map(function(l) {
    var clr =
      (l.type||'').indexOf('Festival')    >= 0 ? 'var(--ember)'  :
      (l.type||'').indexOf('Manufacture') >= 0 ? 'var(--grn)'    :
      (l.type||'').indexOf('Plantation')  >= 0 ? 'var(--grn)'    :
      (l.type||'').indexOf('Flagship')    >= 0 ? 'var(--gold)'   :
      (l.type||'').indexOf('Musée')       >= 0 ? '#7B68EE'       :
      (l.type||'').indexOf('Hotel')       >= 0 ? '#20B2AA'       :
      (l.type||'').indexOf('Members')     >= 0 ? 'var(--ember)'  : 'var(--text2)';
    // Ces champs peuvent provenir de contributions communautaires : on
    // échappe systématiquement, y compris (surtout) en contexte d'attribut.
    var E = _escAttr;
    var desc  = _escHtml(l.desc || l.description || '');
    var phone = l.phone    ? '<a class="lc-link" href="tel:'+E(l.phone)+'">📞 '+_escHtml(l.phone)+'</a>' : '';
    var mapsU = _safeUrl(l.maps_url), webU = _safeUrl(l.website);
    var maps  = mapsU ? '<a class="lc-link" href="'+E(mapsU)+'" target="_blank" rel="noopener noreferrer">🗺 Maps</a>' : '';
    var web   = webU  ? '<a class="lc-link" href="'+E(webU)+'" target="_blank" rel="noopener noreferrer">🌐 Site</a>' : '';
    var insta = l.instagram? '<a class="lc-link" href="https://instagram.com/'+E(String(l.instagram).replace('@',''))+'" target="_blank" rel="noopener noreferrer">📸 '+_escHtml(l.instagram)+'</a>' : '';
    var hours = l.hours    ? '<div class="lc-hours">🕐 '+_escHtml(l.hours)+'</div>' : '';
    // ── Notation interactive ─────────────────────────────
    var loungeId = l.id || null;  // id MySQL (dispo si chargé depuis API)
    var r        = l.rating ? parseFloat(l.rating) : 0;
    var rCount   = l.rating_count || 0;
    var myRating = l.my_rating   || 0;  // note déjà donnée par cet utilisateur

    // Étoiles affichage (moyenne actuelle)
    var avgStars = '';
    for (var s=1;s<=5;s++) avgStars += s <= Math.round(r) ? '★' : '☆';

    var ratingHtml;
    if (loungeId) {
      // Widget interactif : 5 étoiles cliquables
      var interactiveStars = '';
      for (var s=1;s<=5;s++) {
        var filled = s <= myRating ? 'rated' : (s <= Math.round(r) ? 'avg' : 'empty');
        interactiveStars += '<span class="lc-star" data-lid="'+loungeId+'" data-val="'+s+'" data-state="'+filled+'">' +
          (s <= Math.round(r) ? '★' : '☆') + '</span>';
      }
      var avgLabel = r > 0
        ? '<span class="lc-rating-avg">'+r.toFixed(1)+'<span class="lc-rating-cnt"> ('+rCount+')</span></span>'
        : '<span class="lc-rating-avg lc-rating-none">'+t('soyez_premier')+'</span>';
      ratingHtml = '<div class="lc-rating-wrap" data-lid="'+loungeId+'">'+
        '<div class="lc-rating-stars">'+interactiveStars+'</div>'+
        avgLabel+
      '</div>';
    } else {
      // Pas d'id MySQL dispo (données inline) — affichage simple
      ratingHtml = r > 0
        ? '<span class="lc-stars"><span style="color:var(--gold);font-size:11px">'+avgStars+'</span>'+
          '<span style="font-size:9px;color:var(--text2);margin-left:3px">'+r.toFixed(1)+'</span></span>'
        : '';
    }
    var links = [phone,maps,web,insta].filter(Boolean).join('');
    return (
      '<div class="lc-card">' +
        '<div class="lc-top">' +
          '<div class="lc-name">' + _escHtml(l.name) + '</div>' +
          '<div style="display:flex;align-items:center;gap:5px">' +
            (l.price ? '<span class="lc-price">'+_escHtml(l.price)+'</span>' : '') +
            ratingHtml +
          '</div>' +
        '</div>' +
        '<div class="lc-meta">' +
          '<span class="lc-city">📍 ' + _escHtml(l.city||'') + '</span>' +
          '<span class="lc-type" style="color:' + clr + '">· ' + _escHtml(_tr(l.type)||'') + '</span>' +
        '</div>' +
        hours +
        '<div class="lc-desc">' + desc + '</div>' +
        (links ? '<div class="lc-links">'+links+'</div>' : '') +
        '<div class="lc-rating-section">'+ratingHtml+'</div>' +
        (l.id ? '<div class="lc-fav" id="lc-fav-'+l.id+'"></div>' : '') +
        (l.id ? '<div class="lc-photos" id="lc-photos-'+l.id+'"></div>' : '') +
        (l.id ? '<div class="lc-reviews" id="lc-reviews-'+l.id+'"></div>' : '') +
      '</div>'
    );
  }).join('');
  // L'intro est masquable : la fiche pays n'affiche qu'un extrait et
  // annonce le total elle-meme, un decompte partiel y serait trompeur.
  var intro = opts.intro === false ? '' :
    '<div class="lc-intro">' +
      '<span class="lc-badge">' + list.length + ' '+t('lounge_establish')+(list.length>1?'s':'') + '</span>' +
      ' · '+t('lounge_section_of')+' ' + c.name +
    '</div>';
  body.innerHTML = intro + '<div class="lc-grid">' + cards + '</div>';

  // Charger les photos lazily après rendu des cartes
  if (typeof _loadLoungePhotos === 'function') {
    list.forEach(function(l) {
      if (l.id) setTimeout(function() { _loadLoungePhotos(l.id); }, 100);
    });
  }
  // Charger les avis lazily (module reviews.js)
  if (typeof window._loadLoungeReviews === 'function') {
    list.forEach(function(l) {
      if (l.id) setTimeout(function() { window._loadLoungeReviews(l.id); }, 120);
    });
  }
  // Charger les contrôles de favoris lazily (module favorites.js)
  if (typeof window._loadLoungeFavs === 'function') {
    list.forEach(function(l) {
      if (l.id) setTimeout(function() { window._loadLoungeFavs(l.id); }, 90);
    });
  }
}
// ── Gestionnaire de notation — délégation sur loungeBody ────
document.addEventListener('click', function(e) {
  var star = e.target.closest('.lc-star');
  if (!star) return;

  var lid = parseInt(star.dataset.lid, 10);
  var val = parseInt(star.dataset.val, 10);
  if (!lid || !val) return;

  // Compte à l'email vérifié requis pour noter
  if (window.CGAccount && !window.CGAccount.requireVerified()) return;

  // Vérifier que API_BASE est disponible (exposée par contrib.js)
  var _apiBase = window.API_BASE || (typeof API_BASE !== 'undefined' ? API_BASE : null);
  if (!_apiBase || _apiBase.indexOf('VOTRE_DOMAINE') !== -1) {
    console.warn('[Notation] API_BASE non configurée');
    return;
  }

  // Feedback visuel immédiat
  var wrap = star.closest('.lc-rating-wrap');
  var allStars = wrap ? wrap.querySelectorAll('.lc-star') : [];
  allStars.forEach(function(s, i) {
    s.textContent = i < val ? '★' : '☆';
    s.style.color = i < val ? 'var(--gold)' : 'var(--text3)';
    s.style.transform = i < val ? 'scale(1.2)' : 'scale(1)';
  });
  setTimeout(function() {
    allStars.forEach(function(s){ s.style.transform = 'scale(1)'; });
  }, 300);

  // Envoi au serveur
  fetch(_apiBase + '?action=rate', {
    method: 'POST',
    credentials: 'include',
    headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': (window.CGAccount ? window.CGAccount.csrf : '') },
    body: JSON.stringify({ id: lid, rating: val })
  })
  .then(function(r){ return r.json(); })
  .then(function(data) {
    if (data.error) {
      if (data.need_verify && window.CGAccount) window.CGAccount.toast('Vérifiez votre email pour noter.', 'err');
      else console.warn('Rating error:', data.code || data.error);
      return;
    }

    // Warning : table lounge_ratings absente (SQL pas encore importé)
    if (data.warning) {
      console.warn('[Notation]', data.warning);
      // Les étoiles restent colorées mais la note n'est pas persistée
    }

    // Mettre à jour l'affichage avec la vraie moyenne
    var avg    = data.rating;
    var count  = data.rating_count;
    var avgEl  = wrap ? wrap.querySelector('.lc-rating-avg') : null;
    if (avgEl) {
      avgEl.innerHTML = avg.toFixed(1) + '<span class="lc-rating-cnt"> ('+count+')</span>';
      avgEl.classList.remove('lc-rating-none');
    }
    // Mettre à jour les étoiles avec la moyenne du serveur
    allStars.forEach(function(s, i) {
      s.textContent = i < Math.round(avg) ? '★' : '☆';
      s.style.color = i < data.my_rating ? 'var(--gold)' : (i < Math.round(avg) ? 'rgba(201,162,39,0.5)' : 'var(--text3)');
    });
  })
  .catch(function(err) {
    console.warn('Rating fetch error:', err);
    // Remettre les étoiles à leur état précédent si erreur réseau
    if (wrap) {
      wrap.style.opacity = '0.5';
      setTimeout(function(){ wrap.style.opacity = '1'; }, 1000);
    }
  });
});

window.openLoungePanel = openLoungePanel;

// Called when a LOUNGE_COUNTRIES triangle is clicked on globe
window.openLoungePanelForCountry = function(lc) {
  var c = { id:lc.id, name:lc.name, flag:lc.flag, region:'Caves & Lounges', lat:lc.lat, lon:lc.lon };
  flyToCountry(lc);
  openLoungePanel(c);
};

// Called when a producer country is clicked — offer lounge tab
window._mobileOpenPanel = function(c) {
  openPanel(c);
  // Pre-remplissage du panneau des lounges : utile uniquement sur mobile,
  // ou l'onglet doit etre pret. Sur desktop, la fiche pays montre deja un
  // extrait et le bouton « voir tout » remplit le panneau a la demande —
  // pre-remplir dupliquerait les cartes (et leurs identifiants) dans le DOM.
  if (isMobile()) openLoungePanel(c, true);
  if (isMobile()) {
    switchMobileTab('panel');
    var btn = document.getElementById('mnav-panel');
    if (btn) btn.classList.add('has-content');
    var lBtn = document.getElementById('mnav-lounge');
    if (lBtn && typeof LOUNGES !== 'undefined' && LOUNGES[c.id]) lBtn.classList.add('has-content');
  }
};

window._mobileOpenLex = function(c) {
  openLex(c);
  if (isMobile()) {
    var btn = document.getElementById('mnav-lex');
    if (btn) btn.classList.add('has-content');
  }
};

window._mobileFlyTo = function(c) { flyToCountry(c); };

// ── Lounge close button ────────────────────────────────
var loungeCloseBtn = document.getElementById('loungeClose');
if (loungeCloseBtn) {
  loungeCloseBtn.onclick = function() {
    var el = document.getElementById('lounge-panel');
    if (el) { el.classList.remove('open'); el.setAttribute('aria-hidden','true'); }
    selLoungeCountry = null;
    if (isMobile()) switchMobileTab('globe');
    setTimeout(function(){ autoRot = true; }, 1500);
  };
}

// ── Lounge toggle button (show/hide all lounge markers) ─
var loungeToggleBtn = document.getElementById('loungeToggle');
if (loungeToggleBtn) {
  loungeToggleBtn.addEventListener('click', function() {
    showLounges = !showLounges;
    loungeToggleBtn.setAttribute('aria-pressed', String(showLounges));
    loungeToggleBtn.classList.toggle('active', showLounges);
    var leg = document.getElementById('loungeLegend');
    if (leg) leg.style.display = showLounges ? 'flex' : 'none';
    if (!showLounges) {
      selLoungeCountry = null; hoverLoungeCountry = null;
      var lp = document.getElementById('lounge-panel');
      if (lp) lp.classList.remove('open');
    }
  });
}

// ── onLangChange hook (called by i18n.js after applyLang) ─
window.onLangChange = function(lang) {
  if (typeof selCountry !== 'undefined' && selCountry) {
    if (typeof openPanel  === 'function') openPanel(selCountry);
    if (typeof openLex    === 'function') openLex(selCountry);
    openLoungePanel(selCountry);
  } else if (typeof selLoungeCountry !== 'undefined' && selLoungeCountry) {
    openLoungePanel(selLoungeCountry);
  }
  if (typeof selMarket !== 'undefined' && selMarket && typeof openMarketPanel === 'function')
    openMarketPanel(selMarket);
  // La vue Explorer est construite une fois et garde ses libelles :
  // elle se retraduit elle-meme (voir expRefreshLang dans explorer.js).
  if (typeof window.expRefreshLang === 'function') window.expRefreshLang();
  // Liste « Explorer sans le globe » : memes titres de groupe a retraduire.
  if (typeof window._globeA11yRefresh === 'function') window._globeA11yRefresh();
  // Espace membre : bouton, menu et modale sont rendus une fois.
  if (window.CGAccount && typeof window.CGAccount.refreshLang === 'function')
    window.CGAccount.refreshLang();
  document.querySelectorAll('.mlang-btn').forEach(function(b) {
    b.classList.toggle('active', b.getAttribute('data-lang') === lang);
  });
  closeMobileMenu();
};

// ── Swipe left/right to switch tabs ────────────────────
var _swX = 0;
document.addEventListener('touchstart', function(e) { _swX = e.touches[0].clientX; }, {passive:true});
document.addEventListener('touchend', function(e) {
  if (!isMobile()) return;
  var g = document.getElementById('globe');
  if (e.target === g) return;
  var dx  = e.changedTouches[0].clientX - _swX;
  var idx = ALL_TABS.indexOf(mobileActiveTab);
  if (dx < -60 && idx < ALL_TABS.length-1) switchMobileTab(ALL_TABS[idx+1]);
  if (dx >  60 && idx > 0)                 switchMobileTab(ALL_TABS[idx-1]);
}, {passive:true});

// ── Keyboard Escape ────────────────────────────────────
document.addEventListener('keydown', function(e) {
  if (e.key === 'Escape') {
    var modal = document.getElementById('bmodal');
    if (modal && modal.classList.contains('open')) { modal.classList.remove('open'); return; }
    var lp = document.getElementById('lounge-panel');
    if (lp && lp.classList.contains('open')) { lp.classList.remove('open'); return; }
    closeMobileMenu();
  }
});

// ── Auto-detect browser language ──────────────────────
(function() {
  var supported = ['fr','en','es','de','zh','ar'];
  var nav = (navigator.language || 'fr').slice(0,2).toLowerCase();
  if (supported.indexOf(nav) >= 0 && nav !== 'fr' && typeof window.applyLang === 'function') {
    window.applyLang(nav);
  }
})();













