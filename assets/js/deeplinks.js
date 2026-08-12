/* deeplinks.js */
// deeplinks.js — URLs profondes partageables
// ?country=cuba  ?lounge=ivorycoast  ?brand=Cohiba  ?market=usa
// ════════════════════════════════════════════════════════
// Deux responsabilités, longtemps mêlées dans la même fonction :
//
//   1. l'URL suit le panneau ouvert (pour partager et pour revenir) ;
//   2. une pastille de partage se pose dans le bandeau du panneau.
//
// Elles vivaient dans le même observateur, qui rendait la main dès que
// la pastille existait. La pastille n'était en fait JAMAIS posée — son
// ancrage visait « .panel-head », qui n'existe nulle part dans ce
// balisage (les bandeaux s'appellent « .panel-banner ») —, si bien que
// la règle `.share-btn` de components.css n'a jamais rien stylé, et que
// ses `!important` combattaient un adversaire absent.
// ════════════════════════════════════════════════════════

(function() {

// ── Ouvrir une cible ──────────────────────────────────────
/**
 * Ouvre le panneau d'une cible. `delai` laisse au globe le temps de
 * charger ses données au démarrage ; il vaut zéro quand l'appel vient
 * du bouton Retour, où tout est déjà en mémoire.
 */
function ouvrirCible(type, id, delai) {
  var apres = function (fn) { if (delai) setTimeout(fn, delai); else fn(); };

  if (type === 'country') {
    var c = (COUNTRIES||[]).find(function(x){ return x.id===id; });
    if (!c) return;
    apres(function() {
      flyToCountry(c); selCountry = c;
      if (typeof window._mobileOpenPanel === 'function') window._mobileOpenPanel(c);
      else { openPanel(c); openLex(c); }
    });
  } else if (type === 'lounge') {
    var lc = (LOUNGE_COUNTRIES||[]).find(function(x){ return x.id===id; })
          || (COUNTRIES||[]).find(function(x){ return x.id===id; });
    if (!lc) return;
    apres(function() {
      selLoungeCountry = lc;
      flyToCountry(lc);
      if (typeof openLoungePanelForCountry === 'function') openLoungePanelForCountry(lc);
    });
  } else if (type === 'market') {
    var m = (MARKETS||[]).find(function(x){ return x.id===id; });
    if (!m) return;
    apres(function() {
      selMarket = m; flyToCountry(m);
      if (typeof openMarketPanel === 'function') openMarketPanel(m);
    });
  } else if (type === 'brand') {
    apres(function() {
      if (typeof openBrand !== 'function') return;
      var b   = BRANDS_DB ? BRANDS_DB[id] : null;
      var cid = b ? b.country : null;
      var c2  = cid ? (COUNTRIES||[]).find(function(x){ return x.id===cid; }) : null;
      if (c2) { flyToCountry(c2); selCountry = c2; openPanel(c2); }
      setTimeout(function() { openBrand(id, cid||''); }, 500);
    });
  }
}

var TYPES = ['country', 'lounge', 'market', 'brand'];

/** La cible décrite par l'adresse courante, ou null. */
function cibleDeLUrl() {
  var p = new URLSearchParams(window.location.search);
  for (var i = 0; i < TYPES.length; i++) {
    if (p.get(TYPES[i])) return { type: TYPES[i], id: p.get(TYPES[i]) };
  }
  return null;
}

/** Lecture de l'URL au démarrage. */
function parseAndNavigate() {
  var c = cibleDeLUrl();
  // La marque demande un délai un peu plus long : elle ouvre d'abord le
  // panneau de son pays.
  if (c) ouvrirCible(c.type, c.id, c.type === 'brand' ? 700 : 600);
}

// ── L'URL suit le panneau ─────────────────────────────────
/**
 * Écrit l'adresse du panneau ouvert.
 *
 * La LANGUE est conservée : sans réécriture d'URL (serveur de
 * développement, ouverture directe), elle vit dans « ?lang=xx » — la
 * remplacer par « ?country=cuba » ramenait le visiteur au français au
 * premier panneau ouvert, et le lien partagé perdait sa langue.
 *
 * Rien n'est empilé si l'adresse ne change pas : rouvrir le même pays
 * ne doit pas ajouter une étape à l'historique, sinon il faut appuyer
 * trois fois sur Retour pour défaire un clic.
 */
function majUrl(type, id) {
  if (!window.history || !window.history.pushState) return;
  var actuel = new URLSearchParams(window.location.search);
  var p = new URLSearchParams();
  if (actuel.get('lang')) p.set('lang', actuel.get('lang'));
  p.set(type, id);
  var cible = window.location.pathname + '?' + p.toString();
  if (window.location.pathname + window.location.search === cible) return;
  window.history.pushState({ type: type, id: id }, '', cible);
}

// ── Pastille de partage ───────────────────────────────────
function poserPastille(panel, type, getId) {
  var bandeau = panel.querySelector('.panel-banner');
  if (!bandeau || bandeau.querySelector('.share-btn')) return;

  var btn = document.createElement('button');
  btn.className = 'share-btn';
  btn.type = 'button';
  btn.innerHTML = '🔗';
  btn.title = t('ui_copy_link');
  btn.setAttribute('aria-label', t('ui_copy_link'));
  btn.addEventListener('click', function() {
    var id = getId();
    if (!id) return;
    var p = new URLSearchParams();
    var actuel = new URLSearchParams(window.location.search);
    if (actuel.get('lang')) p.set('lang', actuel.get('lang'));
    p.set(type, id);
    var url = window.location.origin + window.location.pathname + '?' + p.toString();
    if (navigator.share) {
      navigator.share({ title: 'CigarOdyssey', url: url }).catch(function(){});
    } else if (navigator.clipboard) {
      navigator.clipboard.writeText(url).then(function() {
        btn.innerHTML = '✓';
        btn.classList.add('copie');
        setTimeout(function(){ btn.innerHTML = '🔗'; btn.classList.remove('copie'); }, 1500);
      });
    }
  });
  bandeau.appendChild(btn);
}

/** Surveille l'ouverture d'un panneau : l'URL à chaque fois, la pastille une fois. */
function suivrePanneau(panelId, type, getId) {
  var panel = document.getElementById(panelId);
  if (!panel) return;
  var observer = new MutationObserver(function() {
    if (!panel.classList.contains('open')) return;
    var id = getId();
    if (!id) return;          // #panel sert au pays ET au marché : le
    majUrl(type, id);         // getId() de l'autre rend null.
    poserPastille(panel, type, getId);
  });
  observer.observe(panel, { attributes: true, attributeFilter: ['class'] });
}

// ── Initialisation ────────────────────────────────────────
window.addEventListener('DOMContentLoaded', function() {
  // L'entrée d'historique par laquelle on ARRIVE n'a pas d'état : le
  // navigateur ne pose que ce qu'on lui donne. Sans cette ligne, ouvrir
  // un lien partagé « ?country=cuba », consulter un autre pays, puis
  // revenir en arrière ne retrouvait pas Cuba — l'étape se lisait comme
  // « aucun panneau » et refermait tout.
  var depart = cibleDeLUrl();
  if (depart && window.history && window.history.replaceState) {
    window.history.replaceState({ type: depart.type, id: depart.id }, '', window.location.href);
  }

  // N'ouvrir un panneau au démarrage QUE si un paramètre URL est présent
  if (window.location.search.length > 1) setTimeout(parseAndNavigate, 600);

  suivrePanneau('panel',        'country', function(){ return selCountry      ? selCountry.id      : null; });
  suivrePanneau('lounge-panel', 'lounge',  function(){ return selLoungeCountry? selLoungeCountry.id: null; });
  suivrePanneau('panel',        'market',  function(){ return selMarket       ? selMarket.id       : null; });
});

// ── Retour arrière navigateur ─────────────────────────────
// Il rechargeait la page entière — 31 fichiers, le globe qui se
// reconstruit, la position perdue — pour revenir à un état déjà présent
// en mémoire. Et à la dernière étape, quand l'historique n'a plus
// d'état, il ne faisait RIEN : l'adresse redevenait « / » pendant que
// le panneau restait ouvert. Or fermer un panneau par le bouton Retour
// est le premier réflexe sur téléphone.
window.addEventListener('popstate', function(e) {
  // Le calque communauté se superpose à tout : c'est lui qui se ferme
  // en premier, sans quoi le Retour fermerait un panneau invisible.
  if (document.body.classList.contains('forum-open')) {
    if (typeof window.fermerForum === 'function') window.fermerForum();
    return;
  }
  var s = e.state;
  if (s && s.type) { ouvrirCible(s.type, s.id, 0); return; }
  if (typeof closePanels === 'function') closePanels();
});

})();
