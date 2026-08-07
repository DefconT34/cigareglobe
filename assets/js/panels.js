/* panels.js */
// panels.js — openLex, openPanel, brandCard, renderHabanos
// Chargement lazy : HABANOS et détails chargés depuis MySQL au clic
// ════════════════════════════════════════════════════════

// ── Lounges du pays ─────────────────────────────────────
// Le rendu est delegue a _renderLoungeCards (app.js), celui du panneau
// des lounges : memes cartes, avec notes, avis, favoris et photos.
// L'ancien rendu local, plus pauvre et sans echappement, a ete retire —
// ces fiches incluent des contributions de membres.
function _fillPanelLounges(c, list) {
  var host = document.getElementById('panel-lounges');
  if (!host) return;

  // Rendu tardif : si la fiche pays n'est plus a l'ecran, on l'abandonne
  // (l'utilisateur a ouvert le panneau complet entre-temps).
  var panelEl = document.getElementById('panel');
  if (panelEl && !panelEl.classList.contains('open')) { host.innerHTML = ''; return; }

  if (!list || !list.length) { host.innerHTML = ''; return; }

  // Sur mobile, l'onglet « Lounges » affiche deja ces fiches : un extrait
  // ici les rendrait deux fois dans le document. Or chaque carte porte des
  // identifiants uniques (lc-fav-42, lc-photos-42...) que les chargeurs
  // resolvent par getElementById — un doublon rendrait le second bloc inerte.
  if (typeof isMobile === 'function' && isMobile()) { host.innerHTML = ''; return; }

  // Un seul jeu de cartes doit exister dans le document : les fiches
  // portent des identifiants uniques (lc-fav-42...) que les chargeurs
  // resolvent par getElementById. Le panneau masque garde sinon ses
  // cartes, et le premier element trouve serait le mauvais.
  var lb = document.getElementById('loungeBody');
  if (lb) lb.innerHTML = '';

  var EXTRAIT = 3;
  // Les mieux notes d'abord : un extrait n'a d'interet que s'il montre
  // le meilleur. Les Etats-Unis comptent 31 etablissements.
  var top = list.slice().sort(function(a, b) {
    return (parseFloat(b.rating) || 0) - (parseFloat(a.rating) || 0);
  }).slice(0, EXTRAIT);

  var total = list.length;
  host.innerHTML =
    '<div class="sec">' + t('lounge_section_of') + ' ' + _escHtml(c.name) +
      ' <span class="lounge-count">' + total + '</span></div>' +
    '<div id="panel-lounges-body"></div>' +
    (total > EXTRAIT
      ? '<button type="button" class="contrib-panel-btn" id="panel-lounges-more">' +
          t('see_all_lounges').replace('{n}', total) + ' →</button>'
      : '');

  _renderLoungeCards(c, _enrichWithMyRatings(top),
                     document.getElementById('panel-lounges-body'), { intro: false });

  var more = document.getElementById('panel-lounges-more');
  if (more) more.addEventListener('click', function() { openLoungePanel(c); });
}

// ── Habanos (depuis HABANOS_DATA, chargé lazy) ────────────
function renderHabanos(countryId) {
  var h = HABANOS_DATA[countryId];
  if (!h) return ''; // pas encore chargé ou inexistant

  if (!h.present) {
    return '\n<div class="sec">Habanos S.A.</div>\n' +
      '<div class="no-habanos-banner">' +
        '<div class="no-habanos-icon">🚫</div>' +
        '<div class="no-habanos-title">' + t('hab_no_rep') + '</div>' +
        '<div class="no-habanos-sub">' + _tr(h.description||'') + '</div>' +
        '<div style="margin-top:8px"><span class="habanos-badge" style="border-color:var(--panel-border);color:var(--text2)">' + _tr(h.status||'') + '</span></div>' +
        ((h.factories||[]).length ? (
          '<div style="margin-top:10px;text-align:left"><div class="sec" style="margin-top:0">' + t('hab_local_mfg') + '</div>' +
          (h.factories||[]).map(function(f) {
            return '<div class="hfactory"><div class="hfactory-icon">🏭</div><div class="hfactory-info">' +
              '<div class="hfactory-name">' + f.name + '</div>' +
              '<div class="hfactory-city">' + f.city + ' · ' + t('ui_founded') + ' ' + f.founded + '</div>' +
              '<div class="hfactory-marques">' + (f.marques||[]).map(function(m){ return '<span class="hfactory-marque">'+_tr(m)+'</span>'; }).join('') + '</div>' +
            '</div></div>';
          }).join('') + '</div>'
        ) : '') +
      '</div>';
  }

  return '\n<div class="sec">Habanos S.A.</div>\n' +
    '<div class="habanos-block">' +
      '<div class="habanos-header">' +
        '<div class="habanos-logo">🏛</div>' +
        '<div class="habanos-title">' +
          '<div class="habanos-name">Habanos S.A.</div>' +
          '<div class="habanos-status" style="color:' + (h.statusColor||h.status_color||'var(--gold)') + '">' + _tr(h.status||'') + '</div>' +
        '</div>' +
      '</div>' +
      '<div style="padding:12px 14px">' +
        '<span class="habanos-badge" style="border-color:' + (h.statusColor||h.status_color||'var(--gold)') + '55;color:' + (h.statusColor||h.status_color||'var(--gold)') + ';background:' + (h.statusColor||h.status_color||'var(--gold)') + '12">' + _tr(h.status||'') + '</span>' +
        '<div class="sec" style="margin-top:0">' + t('hab_key_info') + '</div>' +
        '<div class="srow"><span class="sk">' + t('hab_founded') + '</span><span class="sv">' + (h.founded||'—') + '</span></div>' +
        '<div class="srow"><span class="sk">' + t('hab_ownership') + '</span><span class="sv">' + (h.ownership||'—') + '</span></div>' +
        '<div class="srow"><span class="sk">' + t('hab_hq') + '</span><span class="sv">' + (h.hq||'—') + '</span></div>' +
        '<div class="srow"><span class="sk">' + t('hab_revenue') + '</span><span class="sv">' + (h.revenue||'—') + '</span></div>' +
        '<div class="srow"><span class="sk">' + t('hab_employees') + '</span><span class="sv">' + (h.employees||'—') + '</span></div>' +
        '<div class="habanos-desc">' + _tr(h.description||'') + '</div>' +
        '<div class="sec">' + t('hab_factories') + '</div>' +
        (h.factories||[]).map(function(f) {
          return '<div class="hfactory"><div class="hfactory-icon">🏭</div><div class="hfactory-info">' +
            '<div class="hfactory-name">'+f.name+'</div>' +
            '<div class="hfactory-city">'+f.city+' · ' + t('ui_founded') + ' '+f.founded+'</div>' +
            '<div class="hfactory-marques">'+(f.marques||[]).map(function(m){ return '<span class="hfactory-marque">'+_tr(m)+'</span>'; }).join('')+'</div>' +
          '</div></div>';
        }).join('') +
        '<div class="sec">' + t('hab_official_brands') + '</div>' +
        '<div class="tags">' + (h.marques_officielles||[]).map(function(m){
          return '<span class="tag" style="border-color:'+(h.statusColor||'var(--gold)')+'55;color:'+(h.statusColor||'var(--gold)')+'">'+m+'</span>';
        }).join('') + '</div>' +
        '<div class="sec">' + t('hab_distribution') + '</div>' +
        (h.distributeurs||[]).map(function(d){
          return '<div class="hdist"><span class="hdist-pays">'+_tr(d.pays)+'</span><span class="hdist-nom">'+_tr(d.distributeur)+'</span></div>';
        }).join('') +
        '<div class="sec">' + t('hab_festival') + '</div>' +
        '<div class="hfestival">🎪 ' + (h.festival||'—') + '</div>' +
        '<div class="sec">' + t('hab_certifications') + '</div>' +
        (h.certifications||[]).map(function(cert){ return '<div class="hcert">'+_tr(cert)+'</div>'; }).join('') +
      '</div>' +
    '</div>';
}

// ════════════════════════════════════════════════════════
// LEFT LEXICON PANEL
// ════════════════════════════════════════════════════════
function openLex(c) {
  document.getElementById('lexFlag').textContent = c.flag;
  document.getElementById('lexName').textContent = c.name;
  document.getElementById('lexReg').textContent  = _tr(c.region);
  document.getElementById('lex').classList.add('open');

  function renderLexBody(geo, zones) {
    // `producer_geo` n'a AUCUNE colonne de langue et n'est pas dans le
    // plan de traduction : ses devise/langue/fuseau s'affichaient en
    // francais dans les six langues. Intl les nomme correctement ; la
    // valeur de la base reste le repli si le pays n'est pas connu.
    var inf = window.ficheInfos ? window.ficheInfos(c) : null;
    var heureHtml = inf && inf.heure
      ? '<strong id="lex-heure">' + inf.heure + '</strong> <em>' + inf.fuseau + '</em>'
        + (inf.multi ? '<span class="fiche-note" title="' + t('fiche_multifuseau') + '">*</span>' : '')
      : (geo.timezone || '—');

    document.getElementById('lexBody').innerHTML =
      '<div class="lex-coords">' +
        '<span class="lex-coords-val">📍 ' + (geo.coords || (c.lat+'°N '+Math.abs(c.lon)+'°O')) + '</span>' +
        (window.ficheDistanceHtml ? window.ficheDistanceHtml(c) : '') +
      '</div>' +
      '<div class="lex-sec">'+t('lex_general')+'</div>' +
      '<div class="lex-row"><span class="lex-k">'+t('lex_capital')+'</span><span class="lex-v">' + (geo.capital||'—') + '</span></div>' +
      '<div class="lex-row"><span class="lex-k">'+t('lex_population')+'</span><span class="lex-v">' + (geo.pop||'—') + '</span></div>' +
      '<div class="lex-row"><span class="lex-k">'+t('lex_area')+'</span><span class="lex-v">' + (geo.area||'—') + '</span></div>' +
      '<div class="lex-row"><span class="lex-k">'+t('lex_currency')+'</span><span class="lex-v">' + (inf && inf.devise ? inf.devise : (geo.currency||'—')) + '</span></div>' +
      '<div class="lex-row"><span class="lex-k">'+t('lex_language')+'</span><span class="lex-v">' + (inf && inf.langue ? inf.langue : (geo.language||'—')) + '</span></div>' +
      '<div class="lex-row"><span class="lex-k">'+t('lex_timezone')+'</span><span class="lex-v">' + heureHtml + '</span></div>' +
      '<div class="lex-row"><span class="lex-k">'+t('lex_gdp')+'</span><span class="lex-v">' + (geo.gdp||'—') + '</span></div>' +
      '<div class="lex-row"><span class="lex-k">'+t('lex_independence')+'</span><span class="lex-v">' + (geo.independent||'—') + '</span></div>' +
      '<div class="lex-sec">'+t('lex_tobacco')+'</div>' +
      '<div class="lex-row"><span class="lex-k">'+t('s_volume')+'</span><span class="lex-v">' + (c.production||'—') + '</span></div>' +
      '<div class="lex-row"><span class="lex-k">'+t('lex_revenue_lbl')+'</span><span class="lex-v">' + (c.revenue||'—') + '</span></div>' +
      '<div class="lex-row"><span class="lex-k">'+t('s_harvest_lbl')+'</span><span class="lex-v">' + (_tr(c.harvest)||'—') + '</span></div>' +
      '<div class="lex-row"><span class="lex-k">'+t('s_climate_lbl')+'</span><span class="lex-v">' + (_tr(c.climate)||'—') + '</span></div>' +
      '<div class="lex-row"><span class="lex-k">'+t('s_soil_lbl')+'</span><span class="lex-v">' + (_tr(c.soil)||'—') + '</span></div>' +
      '<div class="lex-sec">'+t('lex_zones')+'</div>' +
      zones.map(function(z) {
        return '<div class="lex-zone-item">' +
          '<div class="lex-zone-dot" style="background:' + z.color + '"></div>' +
          '<div class="lex-zone-info"><div class="lex-zone-name">' + z.name + '</div>' +
          '<div class="lex-zone-note">' + z.note + '</div></div></div>';
      }).join('') +
      '<div class="lex-sec">'+t('lex_coords')+'</div>' +
      zones.map(function(z) {
        return '<div class="lex-row"><span class="lex-k">' + z.name + '</span>' +
          '<span class="lex-v" style="font-family:\'Cinzel\',serif;font-size:9px;color:var(--gold)">' +
          Math.abs(z.lat).toFixed(1)+'°'+(z.lat>0?'N':'S')+' '+Math.abs(z.lon).toFixed(1)+'°'+(z.lon>0?'E':'O')+'</span></div>';
      }).join('');

    // Apres l'injection seulement : l'horloge et le bouton de distance
    // visent des elements du DOM. Ici plutot que chez les appelants —
    // renderLexBody en a deux, et l'un d'eux est differe.
    if (window.ficheActiver) window.ficheActiver(c);
  }

  // Use cached data if available (GEO_INFO and ZONES filled by inline bundle or previous fetch)
  var geo   = GEO_INFO[c.id];
  var zones = ZONES[c.id];
  if (geo && zones) {
    renderLexBody(geo, zones);
  } else {
    document.getElementById('lexBody').innerHTML =
      '<div style="padding:30px;text-align:center;color:var(--text2);font-family:Cinzel,serif;font-size:10px;letter-spacing:.15em">'+t('loading_spinner')+'</div>';
    window.loadCountryDetails(c.id).then(function(data) {
      renderLexBody(data.geo || {}, data.zones || []);
    }).catch(function(err) {
      // Journaliser la cause reelle : ce catch attrape aussi bien un echec
      // reseau qu'une exception du rendu, et le message seul ne permettait
      // pas de les distinguer.
      console.error('[lexique] ' + c.id + ' :', err);
      document.getElementById('lexBody').innerHTML =
        '<div style="padding:20px;color:#e55">' + t('error_loading') + '</div>';
    });
  }
}

document.getElementById('lexClose').onclick = function() {
  document.getElementById('lex').classList.remove('open');
};

// ════════════════════════════════════════════════════════
// RIGHT DETAIL PANEL
// ════════════════════════════════════════════════════════
function openPanel(c) {
  // Fete nationale : ne fait quelque chose QUE le bon jour, et n'empeche
  // jamais le panneau de s'ouvrir (aucun retour n'est teste).
  if (window.celebrerFeteAuClic) window.celebrerFeteAuClic(c);

  animateFlags(c.id,
    document.getElementById('flag-canvas'),
    document.getElementById('panel-flag-cvs'),
    document.getElementById('lex-flag-cvs')
  );
  document.getElementById('flag-bg').classList.add('visible');
  document.getElementById('bFlag').textContent   = c.flag;
  document.getElementById('bName').textContent   = c.name;
  document.getElementById('bRegion').textContent = _tr(c.region);
  document.getElementById('panel').classList.add('open');

  // Exclusion mutuelle : le panneau des lounges occupe la même colonne.
  // openLoungePanel() ferme déjà panel et lex ; sans la réciproque, passer
  // d'un pays à lounges à un pays producteur laissait les deux superposés,
  // chacun avec son en-tête pays. (Le mobile est géré par ses onglets.)
  if (typeof isMobile !== 'function' || !isMobile()) {
    var lp = document.getElementById('lounge-panel');
    if (lp) { lp.classList.remove('open'); lp.setAttribute('aria-hidden', 'true'); }
  }

  // Render immediately with inline data (COUNTRIES already has full detail)
  _renderPanel(c);

  // Etablissements du pays : la donnee arrive apres le rendu du panneau.
  // Sans ce chargement, la section restait silencieusement vide.
  if (typeof window.loadLounges === 'function') {
    window.loadLounges(c.id)
      .then(function(list) { _fillPanelLounges(c, list || []); })
      .catch(function(err) { console.error('[panneau] lounges de ' + c.id + ' :', err); });
  }

  // Enrichissement depuis la base. On interroge TOUJOURS, sans tester la
  // presence en memoire : data.habanos.js pre-remplit HABANOS_DATA avec
  // un instantane francais, si bien que la condition n'etait jamais
  // vraie et que la section restait en francais dans les six langues.
  // Le chargeur met en cache par pays ET par langue : une seule requete.
  {
    window.loadCountryDetails(c.id).then(function() {
      // Re-render habanos section only — DOM surgery
      var panelBody = document.getElementById('panelBody');
      // Conteneur stable : l'ancien marqueur disparaissait des le premier
      // rendu, si bien que la version traduite n'etait jamais reinjectee
      // et le bloc restait dans la langue de l'instantane statique.
      var habBlock = panelBody.querySelector('.habanos-zone');
      if (habBlock) habBlock.innerHTML = renderHabanos(c.id);
    }).catch(function() {});
  }
}

function _renderPanel(c) {
  var tierConf = {
    major:    {bg:'var(--gold-p)',  border:'var(--gold)', color:'var(--gold)', text:t('tier_major_text')},
    notable:  {bg:'#EEF3FE',        border:'#4A7AB5',     color:'#4A7AB5',     text:t('tier_notable_text')},
    emerging: {bg:'#EEF7F1',        border:'var(--grn)',   color:'var(--grn)',   text:t('tier_emerging_text')}
  };
  var tc     = tierConf[c.tier] || tierConf.notable;
  var brands = c.brands || [];
  var iconic = brands.filter(function(b) { return b.iconic; });
  var other  = brands.filter(function(b) { return !b.iconic; });

  var habanos = HABANOS_DATA[c.id]
    ? renderHabanos(c.id)
    : ''; // rempli par l'enrichissement ci-dessous

  document.getElementById('panelBody').innerHTML =
    '<span class="tier-badge" style="background:' + tc.bg + ';border-color:' + tc.border + ';color:' + tc.color + '">' + tc.text + '</span>' +
    '<div class="rev-box"><div>' +
      '<div class="rev-lbl">'+t('rev_annual')+'</div>' +
      '<div class="rev-amt">' + (c.revenue||'—') + '</div>' +
      '<div class="rev-sub">' + (c.revDetail||'') + '</div>' +
    '</div><div style="font-size:28px;opacity:.3">' + c.flag + '</div></div>' +
    '<div class="sec">'+t('s_production')+'</div>' +
    '<div class="srow"><span class="sk">'+t('s_volume')+'</span><span class="sv">' + (c.production||'—') + '</span></div>' +
    '<div class="srow"><span class="sk">'+t('s_harvest_lbl')+'</span><span class="sv">' + (_tr(c.harvest)||'—') + '</span></div>' +
    '<div class="srow"><span class="sk">'+t('s_climate_lbl')+'</span><span class="sv">' + (_tr(c.climate)||'—') + '</span></div>' +
    '<div class="srow"><span class="sk">'+t('s_soil_lbl')+'</span><span class="sv">' + (_tr(c.soil)||'—') + '</span></div>' +
    '<div class="sec">'+t('s_regions_lbl')+'</div>' +
    '<div class="tags">' + (c.regions||[]).map(function(r){ return '<span class="tag">'+r+'</span>'; }).join('') + '</div>' +
    '<div class="sec">'+t('s_varieties_lbl')+'</div>' +
    '<div class="tags">' + (c.varieties||[]).map(function(v){ return '<span class="tag" style="border-color:var(--grn);color:var(--grn)">'+v+'</span>'; }).join('') + '</div>' +
    '<div class="sec">'+t('s_tabacaleras_lbl')+'</div>' +
    '<div class="tags">' + (c.tabacaleras||[]).map(function(t){ return '<span class="tag" style="border-color:var(--gold);color:var(--gold)">'+t+'</span>'; }).join('') + '</div>' +
    '<div class="sec">'+t('s_iconic_brands')+'</div>' +
    '<div class="brand-grid">' + iconic.map(function(b){ return brandCard(b,c); }).join('') + '</div>' +
    (other.length ? '<div class="sec">'+t('s_other_brands')+'</div><div class="brand-grid">' + other.map(function(b){ return brandCard(b,c); }).join('') + '</div>' : '') +
    '<div class="sec">'+t('notes_sommelier')+'</div>' +
    '<div class="sn">' + _tr(c.notes||'') + '</div>' +
    '<div id="panel-lounges"></div>' +
    '<div class="habanos-zone">' + habanos + '</div>';

}

function brandCard(b, c) {
  // Toutes les marques sont cliquables (données chargées depuis MySQL à la demande)
  var safeName = b.name.replace(/'/g, "\\'");
  return '<div class="brand-card ' + (b.iconic?'iconic':'other') + '"' +
    ' onclick="openBrand(\'' + safeName + '\',\'' + c.id + '\')"' +
    ' style="cursor:pointer">' +
    '<div style="display:flex;justify-content:space-between;align-items:center">' +
      '<div class="bn">' + b.name + '</div>' +
      '<span class="btag">' + t('brand_details') + '</span>' +
    '</div>' +
    '<div class="bdesc">' + _tr(b.desc) + '</div>' +
    '<div class="bexpand">' + t('brand_expand') + '</div>' +
  '</div>';
}

document.getElementById('panelClose').onclick = function() {
  document.getElementById('panel').classList.remove('open');
  document.getElementById('lex').classList.remove('open');
  selCountry = null;
  document.getElementById('flag-bg').classList.remove('visible');
  // Sans cela, trois boucles d'animation continuaient de peindre un
  // canvas plein ecran devenu invisible, jusqu'a la fiche suivante.
  if (window.stopFlags) window.stopFlags();
  if (window.ficheArreter) window.ficheArreter();
  setTimeout(function() { autoRot = true; }, 1500);
};

// ════════════════════════════════════════════════════════
// BRAND MODAL — chargement lazy depuis MySQL
// ════════════════════════════════════════════════════════
function openBrand(name, cid) {
  var modal = document.getElementById('bmodal');
  modal.classList.add('open');

  // Afficher skeleton immédiatement
  var c = COUNTRIES.find(function(x){ return x.id === cid; }) || {flag:'',name:cid};
  document.getElementById('bmEy').textContent      = (c.flag?' ':'') + c.flag + 'Maison · ' + c.name;
  document.getElementById('bmName').textContent    = name;
  document.getElementById('bmFounded').textContent = '…';
  document.getElementById('bmHist').textContent    = '';
  document.getElementById('bmGam').innerHTML =
    '<div style="padding:30px;text-align:center;color:var(--text2);font-family:Cinzel,serif;font-size:10px;letter-spacing:.15em">'+t('loading_spinner')+'</div>';

  // Si déjà en cache, afficher immédiatement
  if (BRANDS_DB[name]) {
    _renderBrand(name, cid);
    return;
  }

  // Sinon fetch depuis MySQL
  window.loadBrand(name)
    .then(function() {
      // Le rendu est isole du chargement : une exception ici serait sinon
      // rapportee comme une « erreur de chargement », ce qui envoie le
      // diagnostic dans la mauvaise direction.
      try {
        _renderBrand(name, cid);
      } catch (err) {
        console.error('[marque] rendu de ' + name + ' :', err);
        document.getElementById('bmGam').innerHTML =
          '<div style="padding:20px;color:#e55">' + t('error_loading') + '</div>';
      }
    })
    .catch(function(err) {
      console.error('[marque] chargement de ' + name + ' :', err);
      document.getElementById('bmGam').innerHTML =
        '<div style="padding:20px;color:#e55">' + t('error_loading') + '</div>';
    });
}

function _renderBrand(name, cid) {
  var b = BRANDS_DB[name];
  if (!b) return;
  var c = COUNTRIES.find(function(x){ return x.id === cid; }) || {flag:'', name:cid};

  document.getElementById('bmEy').textContent      = (c.flag ? c.flag + ' ' : '') + 'Maison · ' + c.name;
  document.getElementById('bmName').textContent    = name;
  document.getElementById('bmFounded').textContent = b.founded || '—';
  document.getElementById('bmHist').textContent    = b.history || '';

  // ── Gammes ──────────────────────────────────────────────
  document.getElementById('bmGam').innerHTML = (b.gamme || []).map(function(g) {
    var scoreHtml = (g.scores && g.scores.length)
      ? '<div class="gam-scores">' + g.scores.map(function(s){
          return '<span class="gam-score" title="'+s.source+' '+s.year+'">' +
            (s.score === 100 ? '💯' : '★') + ' ' + s.score + '/100' +
            '<span class="gam-score-src"> ' + s.source + ' ' + s.year + '</span></span>';
        }).join('') + '</div>' : '';
    return '<div class="gam-item" style="border-left-color:' + g.color + '">' +
      '<div class="gam-info">' +
        '<div class="gam-name" style="color:' + g.color + '">' + g.name + '</div>' +
        '<div class="gam-story">' + g.story + '</div>' +
        '<div class="gam-metas">' +
          '<span class="gam-mt">Force: ' + g.force + '</span>' +
          '<span class="gam-mt">Wrapper: ' + g.wrapper + '</span>' +
          (g.vitolas||[]).map(function(v){ return '<span class="gam-mt">'+v+'</span>'; }).join('') +
        '</div>' + scoreHtml +
      '</div></div>';
  }).join('');

  // ── Scores globaux ──────────────────────────────────────
  var scoresEl = document.getElementById('bmScores');
  if (scoresEl && b.scores && b.scores.length) {
    scoresEl.innerHTML = '<div class="bm-section-title">'+t('bm_distinctions')+'</div>' +
      '<div class="bm-scores-grid">' +
      b.scores.map(function(s) {
        return '<div class="bm-score-item">' +
          '<span class="bm-score-val ' + (s.score >= 97 ? 'top' : '') + '">' +
            (s.score === 100 ? '💯' : s.score) + '</span>' +
          '<span class="bm-score-info">' + s.source + ' · ' + s.year +
            (s.vitola ? ' · ' + s.vitola : '') + '</span>' +
        '</div>';
      }).join('') + '</div>';
    scoresEl.style.display = '';
  } else if (scoresEl) { scoresEl.style.display = 'none'; }

  // ── Célébrités ─────────────────────────────────────────
  var celebEl = document.getElementById('bmCeleb');
  if (celebEl && b.celebrities && b.celebrities.length) {
    celebEl.innerHTML = '<div class="bm-section-title">'+t('bm_celebrities')+'</div>' +
      b.celebrities.map(function(cel) {
        return '<div class="bm-celeb"><span class="bm-celeb-name">' + cel.name + '</span>' +
          '<p class="bm-celeb-text">' + cel.anecdote + '</p></div>';
      }).join('');
    celebEl.style.display = '';
  } else if (celebEl) { celebEl.style.display = 'none'; }

  // ── Accords ────────────────────────────────────────────
  var pairEl = document.getElementById('bmPairings');
  if (pairEl && b.pairings && b.pairings.length) {
    pairEl.innerHTML = '<div class="bm-section-title">'+t('bm_pairings')+'</div>' +
      '<div class="bm-pairings">' +
      b.pairings.map(function(p) {
        return '<div class="bm-pair">' +
          '<div class="bm-pair-name">' + p.type + ' — ' + p.name + '</div>' +
          '<div class="bm-pair-notes">' + p.notes + '</div>' +
        '</div>';
      }).join('') + '</div>';
    pairEl.style.display = '';
  } else if (pairEl) { pairEl.style.display = 'none'; }

  // ── Manufacture ────────────────────────────────────────
  var factEl = document.getElementById('bmFactory');
  if (factEl) {
    if (b.factory) {
      factEl.textContent = '🏭 ' + b.factory;
      factEl.style.display = '';
    } else { factEl.style.display = 'none'; }
  }

  // ── Éditions limitées ──────────────────────────────────
  var limitEl = document.getElementById('bmLimited');
  if (limitEl && b.limited_eds && b.limited_eds.length) {
    limitEl.innerHTML = '<div class="bm-section-title">'+t('bm_limited')+'</div>' +
      '<ul class="bm-limited-list">' +
      b.limited_eds.map(function(ed){ return '<li>' + ed + '</li>'; }).join('') +
      '</ul>';
    limitEl.style.display = '';
  } else if (limitEl) { limitEl.style.display = 'none'; }
}


document.getElementById('bmClose').onclick = function() {
  document.getElementById('bmodal').classList.remove('open');
};
document.getElementById('bmBack').onclick = function() {
  document.getElementById('bmodal').classList.remove('open');
};















