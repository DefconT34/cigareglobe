/* contrib.js *//* contrib.js */
// contrib.js — Système de contribution avec backend MySQL
// ════════════════════════════════════════════════════════
// ⚠ Remplacez API_BASE par l'URL de votre serveur
// Ex: 'https://monsite.com/cigar-odyssey/backend/api.php'
// ════════════════════════════════════════════════════════

(function() {

var API_BASE = (window.CG_BACKEND_BASE || '/backend') + '/api.php';
var _CONTRIB_READY = (API_BASE.indexOf('VOTRE_DOMAINE') === -1);
// Exposer globalement pour app.js (notation) et autres modules
window.API_BASE      = API_BASE;
window._CONTRIB_READY = _CONTRIB_READY;
if (!_CONTRIB_READY) {
    console.info('[CigarOdyssey] API_BASE non configurée — contributions désactivées jusqu\'à configuration.');
}

// ── Populate country dropdown ────────────────────────────
function populateCountrySelect() {
  var sel = document.getElementById('c-country');
  if (!sel || sel.options.length > 1) return;

  var all = [];
  if (typeof COUNTRIES !== 'undefined') {
    COUNTRIES.forEach(function(c) { all.push({ id:c.id, name:c.flag+' '+c.name }); });
  }
  if (typeof LOUNGE_COUNTRIES !== 'undefined') {
    LOUNGE_COUNTRIES.forEach(function(c) { all.push({ id:c.id, name:c.flag+' '+c.name }); });
  }
  all.sort(function(a,b){ return a.name.slice(2).localeCompare(b.name.slice(2)); });
  all.forEach(function(c) {
    var o = document.createElement('option');
    o.value = c.id; o.textContent = c.name;
    sel.appendChild(o);
  });
  var o = document.createElement('option');
  o.value = '__other__'; o.textContent = '🌍 Autre pays';
  sel.appendChild(o);
}

// ── Open modal ───────────────────────────────────────────
window.openContribModal = function(prefilledCountry) {
  var modal = document.getElementById('contrib-modal');
  if (!modal) return;

  // Compte à l'email vérifié requis pour contribuer
  if (window.CGAccount && !window.CGAccount.requireVerified()) return;

  // Reset
  document.getElementById('contrib-form-wrap').style.display = '';
  document.getElementById('contrib-success').classList.remove('show');
  ['c-name','c-city','c-phone','c-desc','c-source'].forEach(function(id){
    var el = document.getElementById(id);
    if (el) { el.value = ''; el.style.borderColor = ''; }
  });

  if (prefilledCountry) {
    var sel = document.getElementById('c-country');
    if (sel) sel.value = prefilledCountry;
  }

  modal.setAttribute('aria-hidden','false');
  modal.classList.add('open');
  document.body.style.overflow = 'hidden';
  setTimeout(function(){ var f=document.getElementById('c-name'); if(f) f.focus(); }, 300);

  // Load existing contributions for this country
  if (prefilledCountry) loadContributions(prefilledCountry);
};

function closeContribModal() {
  var modal = document.getElementById('contrib-modal');
  if (!modal) return;
  modal.classList.remove('open');
  modal.setAttribute('aria-hidden','true');
  document.body.style.overflow = '';
}

// ── Load contributions for a country ─────────────────────
function loadContributions(countryId) {
  var panel = document.getElementById('contrib-existing');
  if (!panel) return;
  panel.innerHTML = '<div style="color:var(--text2);font-size:11px;padding:8px 0">Chargement…</div>';

  if (!_CONTRIB_READY) { panel.innerHTML = ''; return; }
  fetch(API_BASE + '?action=list&country=' + encodeURIComponent(countryId))
    .then(function(r){ return r.json(); })
    .then(function(data) {
      renderContributions(data.contributions || [], panel, countryId);
    })
    .catch(function() {
      panel.innerHTML = '';
    });
}

function renderContributions(contribs, panel, countryId) {
  if (!contribs.length) {
    panel.innerHTML = '<div style="color:var(--text2);font-size:10px;padding:4px 0;opacity:.6">Aucune contribution pour ce pays.</div>';
    return;
  }

  var html = '<div style="margin-top:12px">';
  html += '<div style="font-family:Cinzel,serif;font-size:7px;letter-spacing:.2em;color:var(--gold);text-transform:uppercase;margin-bottom:8px">';
  html += '✏ Contributions communautaires (' + contribs.length + ')</div>';

  contribs.forEach(function(c) {
    var scoreColor = c.votes_up > c.votes_down ? 'var(--grn)' : c.votes_down > c.votes_up ? '#e55' : 'var(--text2)';
    var statusBadge = c.status === 'approved'
      ? '<span style="color:var(--grn);font-size:9px">✅ Approuvé</span>'
      : '<span style="color:#c9a227;font-size:9px">⏳ En attente</span>';

    html += '<div style="background:var(--bg3);border:1px solid var(--panel-border);border-left:3px solid #8B2BE2;border-radius:3px;padding:8px 10px;margin-bottom:6px">';
    html += '<div style="display:flex;justify-content:space-between;align-items:start;gap:8px">';
    html += '<div>';
    html += '<div style="font-family:Playfair Display,serif;font-size:12px;font-weight:700;color:var(--text)">' + escHtml(c.name) + '</div>';
    html += '<div style="font-size:10px;color:var(--text2);margin-top:2px">📍 ' + escHtml(c.city) + '</div>';
    html += '</div>';
    html += statusBadge;
    html += '</div>';
    html += '<div style="font-size:10px;color:var(--text2);margin-top:5px;line-height:1.5">' + escHtml(c.desc ? c.desc.substring(0,120)+'…' : '') + '</div>';

    // Vote buttons (only for pending)
    if (c.status === 'pending') {
      html += '<div style="display:flex;align-items:center;gap:8px;margin-top:8px">';
      html += '<span style="font-size:10px;color:' + scoreColor + '">Score: ' + (c.votes_up - c.votes_down) + '</span>';
      html += '<button onclick="castVote(' + c.id + ',1,this)" style="padding:3px 10px;background:' +
        (c.my_vote===1?'var(--grn)':'var(--bg2)') + ';border:1px solid var(--panel-border);border-radius:2px;cursor:pointer;font-size:11px;color:var(--text);transition:.2s" title="Ce lieu existe bien">👍 ' + c.votes_up + '</button>';
      html += '<button onclick="castVote(' + c.id + ',-1,this)" style="padding:3px 10px;background:' +
        (c.my_vote===-1?'#e55':'var(--bg2)') + ';border:1px solid var(--panel-border);border-radius:2px;cursor:pointer;font-size:11px;color:var(--text);transition:.2s" title="Ce lieu n\'existe pas">👎 ' + c.votes_down + '</button>';
      html += '<span style="font-size:9px;color:var(--text2);opacity:.6">3 👍 = validation automatique</span>';
      html += '</div>';
    }
    html += '</div>';
  });

  html += '</div>';
  panel.innerHTML = html;
}

// ── Vote ─────────────────────────────────────────────────
window.castVote = function(id, vote, btn) {
  btn.disabled = true;
  if (!_CONTRIB_READY) { btn.disabled = false; return; }
  fetch(API_BASE + '?action=vote', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ id: id, vote: vote })
  })
  .then(function(r){ return r.json(); })
  .then(function(data) {
    if (data.error) { alert(data.error); btn.disabled = false; return; }

    // Refresh the contribution card
    var container = btn.closest('[style*="border-left:3px"]');
    if (!container) { btn.disabled = false; return; }

    // Update vote counts on buttons
    var btns = container.querySelectorAll('button');
    if (btns[0]) {
      btns[0].textContent = '👍 ' + data.votes_up;
      btns[0].style.background = data.my_vote === 1 ? 'var(--grn)' : 'var(--bg2)';
    }
    if (btns[1]) {
      btns[1].textContent = '👎 ' + data.votes_down;
      btns[1].style.background = data.my_vote === -1 ? '#e55' : 'var(--bg2)';
    }

    // Score
    var scoreEl = container.querySelector('span');
    if (scoreEl) {
      var net = data.votes_up - data.votes_down;
      scoreEl.textContent = 'Score: ' + net;
      scoreEl.style.color = net > 0 ? 'var(--grn)' : net < 0 ? '#e55' : 'var(--text2)';
    }

    if (data.approved) {
      container.style.borderLeftColor = 'var(--grn)';
      container.querySelector('[style*="⏳"]') && (container.innerHTML += '<div style="color:var(--grn);font-size:10px;margin-top:4px">✅ Seuil atteint — sera intégré prochainement !</div>');
    }
    btn.disabled = false;
  })
  .catch(function() { btn.disabled = false; });
};

// ── Submit ────────────────────────────────────────────────
// Texte d'origine du message de succès (restauré si l'ajout repasse par la modération)
var _successSubHtml = null;

function submitContribution() {
  var country      = document.getElementById('c-country').value;
  var country_name = document.getElementById('c-country').options[document.getElementById('c-country').selectedIndex]?.text?.replace(/^\S+\s/,'') || country;
  var name         = document.getElementById('c-name').value.trim();
  var city         = document.getElementById('c-city').value.trim();
  var type         = document.getElementById('c-type').value;
  var phone        = document.getElementById('c-phone').value.trim();
  var desc         = document.getElementById('c-desc').value.trim();
  var source       = document.getElementById('c-source').value.trim();
  // L'email du contributeur provient du compte connecté (backend) — plus de champ formulaire.

  // Validation
  var errors = false;
  [['c-country',country],['c-name',name],['c-city',city],['c-desc',desc]].forEach(function(p){
    var el = document.getElementById(p[0]);
    if (!p[1]) { el.style.borderColor='#e55'; errors=true; }
    else el.style.borderColor = '';
  });
  if (errors) return;

  var btn = document.getElementById('contribSubmit');
  btn.disabled = true;
  btn.textContent = 'Envoi…';

  if (!_CONTRIB_READY) {
    btn.disabled = false; btn.textContent = 'Envoyer ›';
    alert('⚠ L\'API n\'est pas encore configurée. Remplacez VOTRE_DOMAINE dans le fichier HTML.');
    return;
  }
  fetch(API_BASE + '?action=submit', {
    method: 'POST',
    credentials: 'include',
    headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': (window.CGAccount ? window.CGAccount.csrf : '') },
    body: JSON.stringify({ country_id:country, country_name:country_name, name:name, city:city, type:type, phone:phone, description:desc, source_url:source })
  })
  .then(function(r){ return r.json(); })
  .then(function(data) {
    btn.disabled = false; btn.textContent = 'Envoyer ›';
    if (data.error) {
      if (data.need_verify && window.CGAccount) { closeContribModal(); window.CGAccount.toast('Vérifiez votre email pour contribuer.', 'err'); return; }
      alert('⚠ ' + data.error); return;
    }
    // Show success — message adapté si l'ajout est publié directement
    // (contributeur de confiance : pas de passage par la modération)
    var sub = document.querySelector('#contrib-success .contrib-success-sub');
    if (sub) {
      if (_successSubHtml === null) _successSubHtml = sub.innerHTML;  // mémoriser l'original
      if (data.auto_approved) {
        sub.removeAttribute('data-i18n');   // ne pas se faire écraser par applyLang
        sub.innerHTML = 'Publié immédiatement — merci ! Votre statut de contributeur de confiance '
                      + 'dispense vos ajouts de la file de modération.';
      } else {
        sub.setAttribute('data-i18n', 'contrib_thanks_sub');
        sub.innerHTML = _successSubHtml;
      }
    }
    document.getElementById('contrib-form-wrap').style.display = 'none';
    document.getElementById('contrib-success').classList.add('show');
    setTimeout(closeContribModal, 3000);
  })
  .catch(function() {
    btn.disabled = false; btn.textContent = 'Envoyer ›';
    alert('Erreur réseau. Vérifiez votre connexion et réessayez.');
  });
}

// ── Inject vote panel in lounge panel ─────────────────────
window.injectContribButton = function(countryId) {
  var body = document.getElementById('loungeBody');
  if (!body) return;

  var existing = body.querySelector('.contrib-panel-btn');
  if (existing) existing.remove();
  var epanel = body.querySelector('#contrib-existing');
  if (epanel) epanel.remove();

  // Contribute button
  var btn = document.createElement('button');
  btn.className = 'contrib-panel-btn';
  btn.innerHTML = '✏ &nbsp;Signaler un établissement manquant';
  btn.onclick = function() { window.openContribModal(countryId); };
  body.appendChild(btn);

  // Existing contributions panel
  var panel = document.createElement('div');
  panel.id = 'contrib-existing';
  body.appendChild(panel);
  loadContributions(countryId);
};

function escHtml(s) {
  return String(s||'').replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;');
}

// ── Wire up events ────────────────────────────────────────
document.addEventListener('DOMContentLoaded', function() {
  populateCountrySelect();

  // Floating button — pre-fills with selected country
  var floatBtn = document.getElementById('contrib-btn');
  if (floatBtn) {
    floatBtn.addEventListener('click', function() {
      var pre = (typeof selCountry !== 'undefined' && selCountry) ? selCountry.id
              : (typeof selLoungeCountry !== 'undefined' && selLoungeCountry) ? selLoungeCountry.id
              : '';
      window.openContribModal(pre);
    });
  }

  document.getElementById('contribClose')?.addEventListener('click', closeContribModal);
  document.getElementById('contribSubmit')?.addEventListener('click', submitContribution);

  // Backdrop close
  document.getElementById('contrib-modal')?.addEventListener('click', function(e) {
    if (e.target === this) closeContribModal();
  });

  // Escape
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
      var m = document.getElementById('contrib-modal');
      if (m?.classList.contains('open')) closeContribModal();
    }
  });
});

})();



