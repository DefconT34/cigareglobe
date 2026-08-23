/* fete.js */
// fete.js — Celebration de la fete nationale d'un pays
//
// ════════════════════════════════════════════════════════
// Au clic sur un pays, SI la date du jour est celle de sa fete
// nationale, une banniere et une pluie de confettis saluent
// l'anniversaire. Les 364 autres jours, ce module ne fait rien de
// visible : le panneau s'ouvre exactement comme avant.
//
// Ce qu'il ne fait pas, deliberement :
//   - il n'intercepte AUCUN clic (pointer-events:none sur le voile, la
//     seule exception etant le bouton de fermeture) ;
//   - il ne bloque pas l'ouverture du panneau, qui se poursuit en
//     parallele ;
//   - il ne se rejoue pas tant que la page reste ouverte, une fois par
//     pays et par visite ;
//   - il n'anime rien si l'utilisateur demande « moins d'animations » —
//     la banniere s'affiche alors sans mouvement, et sans confettis.
//
// POUR LE VOIR sans attendre le bon jour :
//   http://.../?fete=CU        force la celebration cubaine
//   testerFete('BR')           depuis la console
// Les tests de bout en bout utilisent le parametre d'URL : sans lui, un
// test de cette fonctionnalite dependrait du jour ou il s'execute.
// ════════════════════════════════════════════════════════

(function () {
  'use strict';

  var DUREE_MS   = 7000;   // avant retrait automatique
  var NB_PIECES  = 90;     // confettis
  var _vues      = {};     // ISO deja celebres pendant cette visite
  var _timer     = null;
  var _raf       = null;

  /** L'utilisateur demande-t-il moins d'animations ? */
  function mouvementReduit() {
    // globe.js entretient deja cet etat et le tient a jour au changement
    // de reglage ; on s'y raccroche plutot que d'ouvrir un second
    // matchMedia qui pourrait en diverger.
    if (typeof window._reduceMotion === 'boolean') return window._reduceMotion;
    try { return window.matchMedia('(prefers-reduced-motion: reduce)').matches; }
    catch (e) { return false; }
  }

  /** Fete du jour pour ce code ISO, ou null. */
  function feteDuJour(iso, quand) {
    var table = window.FETES_NATIONALES || {};
    var f = iso && table[iso];
    if (!f) return null;
    var d = quand || new Date();
    // getMonth() est base sur zero ; la table, elle, est ecrite en mois
    // reels (1-12) pour rester relisible a l'oeil nu.
    if (d.getMonth() + 1 !== f[0] || d.getDate() !== f[1]) return null;
    return { mois: f[0], jour: f[1], annee: f[2], type: f[3] };
  }

  /** Couleurs des confettis : la palette du theme, pas un arc-en-ciel. */
  function palette() {
    var s = getComputedStyle(document.documentElement);
    var lues = ['--gold', '--gold-l', '--gold-b', '--grn', '--red']
      .map(function (v) { return (s.getPropertyValue(v) || '').trim(); })
      .filter(Boolean);
    return lues.length ? lues : ['#B07800', '#D09800', '#7A5200'];
  }

  function retirer() {
    if (_timer) { clearTimeout(_timer); _timer = null; }
    if (_raf)   { cancelAnimationFrame(_raf); _raf = null; }
    var vieux = document.getElementById('fete-zone');
    if (vieux) vieux.parentNode.removeChild(vieux);
  }

  /**
   * Confettis sur un canvas dedie.
   *
   * Canvas plutot que des elements du DOM : 90 noeuds animes forceraient
   * autant de recalculs de mise en page, sur une page dont le globe
   * occupe deja la boucle de rendu.
   */
  function confettis(cvs) {
    var ctx = cvs.getContext('2d');
    var dpr = window.devicePixelRatio || 1;
    var L = cvs.clientWidth, H = cvs.clientHeight;
    cvs.width = L * dpr; cvs.height = H * dpr;
    ctx.scale(dpr, dpr);

    var couleurs = palette();
    var pieces = [];
    for (var i = 0; i < NB_PIECES; i++) {
      pieces.push({
        x: Math.random() * L,
        y: -20 - Math.random() * H * 0.6,
        l: 6 + Math.random() * 6,
        h: 9 + Math.random() * 8,
        vy: 1.6 + Math.random() * 2.4,
        vx: -0.7 + Math.random() * 1.4,
        rot: Math.random() * Math.PI,
        vrot: -0.09 + Math.random() * 0.18,
        c: couleurs[(Math.random() * couleurs.length) | 0]
      });
    }

    var debut = Date.now();
    (function boucle() {
      var age = Date.now() - debut;
      ctx.clearRect(0, 0, L, H);
      // Fondu sur le dernier tiers : une disparition nette ferait
      // clignoter la fin de l'animation.
      var opacite = age > DUREE_MS * 0.66
        ? Math.max(0, 1 - (age - DUREE_MS * 0.66) / (DUREE_MS * 0.34))
        : 1;
      ctx.globalAlpha = opacite;

      for (var i = 0; i < pieces.length; i++) {
        var p = pieces[i];
        p.y += p.vy; p.x += p.vx; p.rot += p.vrot;
        if (p.y > H + 20) { p.y = -20; p.x = Math.random() * L; }
        ctx.save();
        ctx.translate(p.x, p.y);
        ctx.rotate(p.rot);
        ctx.fillStyle = p.c;
        ctx.fillRect(-p.l / 2, -p.h / 2, p.l, p.h);
        ctx.restore();
      }
      ctx.globalAlpha = 1;
      if (age < DUREE_MS) _raf = requestAnimationFrame(boucle);
    })();
  }

  /**
   * Celebre la fete d'un pays, si c'est le jour.
   *
   * @param pays  objet portant au moins { name, flag } — c'est le
   *              denominateur commun de producer_countries, markets et
   *              lounge_countries.
   * @param force true pour ignorer la date (parametre ?fete=, tests)
   */
  function celebrer(pays, force) {
    if (!pays || !pays.flag) return false;
    var iso = window.isoDepuisDrapeau ? window.isoDepuisDrapeau(pays.flag) : '';
    if (!iso) return false;

    var f = feteDuJour(iso);
    if (!f && force) {
      var brut = (window.FETES_NATIONALES || {})[iso];
      if (brut) f = { mois: brut[0], jour: brut[1], annee: brut[2], type: brut[3] };
    }
    if (!f) return false;

    // Une fois par pays et par visite : rouvrir la meme fiche ne relance
    // pas la banniere. Le forcage passe outre, sinon un test ne pourrait
    // pas se rejouer.
    if (_vues[iso] && !force) return false;
    _vues[iso] = true;

    retirer();

    var zone = document.createElement('div');
    zone.id = 'fete-zone';
    zone.className = 'fete-zone';

    var reduit = mouvementReduit();
    if (!reduit) {
      var cvs = document.createElement('canvas');
      cvs.className = 'fete-confettis';
      cvs.setAttribute('aria-hidden', 'true');
      zone.appendChild(cvs);
    }

    var libelle = t(f.type === 'i' ? 'fete_independance' : 'fete_nationale');
    var depuis  = f.annee ? t('fete_depuis').replace('{annee}', f.annee) : '';

    var carte = document.createElement('div');
    carte.className = 'fete-carte' + (reduit ? ' fete-sans-mouvement' : '');
    // role=status + aria-live : annonce a un lecteur d'ecran sans lui
    // voler le focus, qui doit rester la ou l'utilisateur l'a mis.
    carte.setAttribute('role', 'status');
    carte.setAttribute('aria-live', 'polite');

    var drapeau = document.createElement('span');
    drapeau.className = 'fete-drapeau';
    drapeau.setAttribute('aria-hidden', 'true');
    drapeau.innerHTML = drapeauImg(pays.id, 'fete-drapeau-img', 42, 28);

    var textes = document.createElement('div');
    textes.className = 'fete-textes';
    var l1 = document.createElement('strong');
    l1.className = 'fete-libelle';
    l1.textContent = libelle;
    var l2 = document.createElement('span');
    l2.className = 'fete-pays';
    // textContent, jamais innerHTML : les noms viennent de la base.
    l2.textContent = pays.name + (depuis ? ' · ' + depuis : '');
    textes.appendChild(l1);
    textes.appendChild(l2);

    var fermer = document.createElement('button');
    fermer.type = 'button';
    fermer.className = 'fete-fermer';
    fermer.setAttribute('aria-label', t('fete_fermer'));
    fermer.textContent = '✕';
    fermer.addEventListener('click', retirer);

    carte.appendChild(drapeau);
    carte.appendChild(textes);
    carte.appendChild(fermer);
    zone.appendChild(carte);
    document.body.appendChild(zone);

    if (!reduit) confettis(zone.querySelector('.fete-confettis'));
    _timer = setTimeout(retirer, DUREE_MS);
    return true;
  }

  // Echap referme, comme les autres surfaces de l'application.
  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape' && document.getElementById('fete-zone')) retirer();
  });

  /**
   * Point d'entree unique des panneaux.
   *
   * Les trois panneaux (pays producteur, marche, pays a lounges)
   * appellent ceci et rien d'autre : la logique de forcage reste ici
   * plutot que d'etre recopiee trois fois.
   */
  function auClic(pays) {
    if (!pays || !pays.flag) return false;
    var force = !!window.FETE_FORCEE &&
                window.isoDepuisDrapeau(pays.flag) === window.FETE_FORCEE;
    return celebrer(pays, force);
  }

  window.celebrerFete       = celebrer;
  window.celebrerFeteAuClic = auClic;
  window.feteDuJour         = feteDuJour;
  window.testerFete   = function (iso) {
    var d = (window.COUNTRIES || []).concat(window.MARKETS || [],
                                            window.LOUNGE_COUNTRIES || []);
    for (var i = 0; i < d.length; i++) {
      if (window.isoDepuisDrapeau(d[i].flag) === iso) return celebrer(d[i], true);
    }
    return false;
  };

  // ── Forcage par l'URL (?fete=CU) ─────────────────────────
  // Sert aux tests et a la relecture. Ne lit qu'un code ISO, compare a
  // une table fermee : rien d'arbitraire n'atteint le DOM.
  try {
    var p = new URLSearchParams(location.search).get('fete');
    window.FETE_FORCEE = (p && /^[A-Za-z]{2}$/.test(p)) ? p.toUpperCase() : null;
  } catch (e) { window.FETE_FORCEE = null; }
})();
