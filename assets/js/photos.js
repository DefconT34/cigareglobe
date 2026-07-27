/* photos.js */
(function() {
var PHOTOS_API = (window.CG_BACKEND_BASE || '/backend') + '/photos.php';
var _cache = {};
var _loading = {};

window._loadLoungePhotos = function(loungeId, countryId, loungeName) {
  var cacheKey = loungeId ? String(loungeId) : ((countryId||'') + '|' + (loungeName||''));
  if (!cacheKey || cacheKey === '|') return;

  var safeKey = cacheKey.replace(/[^a-z0-9_-]/gi, '_');
  var container = document.getElementById('lc-photos-' + safeKey)
               || document.getElementById('lc-photos-' + loungeId);
  if (!container) return;
  if (_loading[cacheKey]) return;
  if (_cache[cacheKey]) { _renderPhotos(cacheKey, _cache[cacheKey], container); return; }

  _loading[cacheKey] = true;
  var url = PHOTOS_API + '?action=list';
  if (loungeId) {
    url += '&lounge_id=' + encodeURIComponent(loungeId);
  } else {
    url += '&country_id=' + encodeURIComponent(countryId||'') + '&lounge_name=' + encodeURIComponent(loungeName||'');
  }

  fetch(url)
    .then(function(r) { return r.json(); })
    .then(function(data) {
      delete _loading[cacheKey];
      var photos = (data.photos || []).filter(function(p) { return p.is_approved; });
      _cache[cacheKey] = photos;
      if (photos.length) _renderPhotos(cacheKey, photos, container);
    })
    .catch(function() { delete _loading[cacheKey]; });
};

function _renderPhotos(cacheKey, photos, container) {
  if (!container || !photos.length) return;
  var primaryIdx = 0;
  photos.forEach(function(p, i) { if (p.is_primary) primaryIdx = i; });
  var safeId = cacheKey.replace(/'/g, '_').replace(/"/g, '_');

  var h = '<div class="lc-photo-gallery" data-lid="' + safeId + '" data-cur="' + primaryIdx + '">';
  h += '<div class="lc-photo-hero" onclick="lcPhotoExpand(\'' + safeId + '\',' + primaryIdx + ')">';
  h += '<img src="' + photos[primaryIdx].thumb + '" alt="Photo lounge" loading="lazy" class="lc-photo-img">';
  if (photos[primaryIdx].caption) h += '<div class="lc-photo-caption">' + photos[primaryIdx].caption + '</div>';
  if (photos.length > 1) h += '<span class="lc-photo-count">' + photos.length + ' \uD83D\uDCF7</span>';
  h += '</div>';

  if (photos.length > 1) {
    h += '<div class="lc-photo-strip">';
    photos.forEach(function(p, i) {
      h += '<img src="' + p.thumb + '" alt="" loading="lazy" class="lc-photo-thumb' + (i===primaryIdx?' active':'') + '" onclick="lcPhotoSelect(\'' + safeId + '\',' + i + ')">';
    });
    h += '</div>';
  }
  h += '</div>';
  container.innerHTML = h;
  container._photos = photos;
  container._lid = cacheKey;
}

window.lcPhotoSelect = function(safeId, idx) {
  var gal = document.querySelector('.lc-photo-gallery[data-lid="' + safeId + '"]');
  if (!gal) return;
  var cont = gal.parentElement;
  var photos = cont ? cont._photos : null;
  if (!photos || !photos[idx]) return;
  var hero = gal.querySelector('.lc-photo-hero img');
  if (hero) hero.src = photos[idx].thumb;
  var cap = gal.querySelector('.lc-photo-caption');
  if (cap) cap.textContent = photos[idx].caption || '';
  gal.querySelectorAll('.lc-photo-thumb').forEach(function(t,i){ t.classList.toggle('active', i===idx); });
  gal.dataset.cur = idx;
};

window.lcPhotoExpand = function(safeId, idx) {
  var gal = document.querySelector('.lc-photo-gallery[data-lid="' + safeId + '"]');
  var cont = gal ? gal.parentElement : null;
  var photos = cont ? cont._photos : null;
  if (!photos || !photos[idx]) return;
  var lb = document.getElementById('lc-lightbox');
  if (!lb) {
    lb = document.createElement('div');
    lb.id = 'lc-lightbox';
    lb.innerHTML = '<div class="lb-backdrop" onclick="lcLightboxClose()"></div>' +
      '<div class="lb-content">' +
        '<button class="lb-close" onclick="lcLightboxClose()">&#10005;</button>' +
        '<button class="lb-prev" onclick="lcLightboxNav(-1)">&#8249;</button>' +
        '<button class="lb-next" onclick="lcLightboxNav(1)">&#8250;</button>' +
        '<img id="lb-img" src="" alt="" loading="lazy"><div id="lb-caption"></div><div id="lb-counter"></div>' +
      '</div>';
    document.body.appendChild(lb);
  }
  lb._safeId = safeId; lb._photos = photos; lb._idx = idx;
  _updateLb(lb);
  lb.classList.add('open');
  document.body.style.overflow = 'hidden';
};

function _updateLb(lb) {
  var p = lb._photos[lb._idx];
  var img = document.getElementById('lb-img');
  var cap = document.getElementById('lb-caption');
  var ctr = document.getElementById('lb-counter');
  if (img) img.src = p.url || p.thumb;
  if (cap) cap.textContent = p.caption || '';
  if (ctr) ctr.textContent = (lb._idx + 1) + ' / ' + lb._photos.length;
}

window.lcLightboxClose = function() {
  var lb = document.getElementById('lc-lightbox');
  if (lb) { lb.classList.remove('open'); document.body.style.overflow = ''; }
};

window.lcLightboxNav = function(dir) {
  var lb = document.getElementById('lc-lightbox');
  if (!lb) return;
  lb._idx = (lb._idx + dir + lb._photos.length) % lb._photos.length;
  _updateLb(lb);
};

document.addEventListener('keydown', function(e) {
  var lb = document.getElementById('lc-lightbox');
  if (!lb || !lb.classList.contains('open')) return;
  if (e.key === 'ArrowRight') lcLightboxNav(1);
  if (e.key === 'ArrowLeft')  lcLightboxNav(-1);
  if (e.key === 'Escape')     lcLightboxClose();
});

})();


