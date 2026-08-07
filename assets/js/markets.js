/* markets.js *//* markets.js */
// markets.js — mktToggle listener + openMarketPanel
// ════════════════════════════════════════════════════════
const mktBtn = document.getElementById('mktToggle');
mktBtn.addEventListener('click', ()=>{
  showMarkets = !showMarkets;
  mktBtn.style.background   = showMarkets ? 'rgba(26,107,181,0.2)'   : 'rgba(26,107,181,0.08)';
  mktBtn.style.borderColor  = showMarkets ? 'rgba(26,107,181,0.7)'   : 'rgba(26,107,181,0.4)';
  mktBtn.style.fontWeight   = showMarkets ? '700' : '400';
  document.getElementById('mktLegend').style.display = showMarkets ? 'flex' : 'none';
  if(!showMarkets){ selMarket = null; }
});

function openMarketPanel(m){
  if (window.celebrerFeteAuClic) window.celebrerFeteAuClic(m);

  // Le panneau des marches partage son en-tete avec la fiche pays. Sans
  // arret, le drapeau anime du pays precedent restait affiche sous le
  // nom du marche : « Japon » sur le drapeau cubain.
  if (window.stopFlags) window.stopFlags();

  // m is already full from globe load — no extra API call needed
  document.getElementById('bFlag').textContent   = m.flag;
  document.getElementById('bName').textContent   = m.name;
  document.getElementById('bRegion').textContent = t('mkt_consumer') + m.rank;

  // Détecter la tendance sur la valeur FR originale (stockée en FR dans les données)
  const trendClass = (m.trend||'').includes('forte croissance') ? 'trend-up' :
                     (m.trend||'').includes('croissance')       ? 'trend-up' :
                     (m.trend||'').includes('déclin')           ? 'trend-dn' : 'trend-st';
  const trendIcon  = (m.trend||'').includes('croissance') ? '📈' :
                     (m.trend||'').includes('déclin')      ? '📉' : '→';
  const trendDisplay = _tr(m.trend); // valeur traduite pour affichage
  const barW = Math.round((11 - m.rank) / 10 * 100);

  document.getElementById('panelBody').innerHTML =
    '<span class="market-badge">🌍 ' + t('mkt_badge') + ' · ' + t('market_rank') + ' #' + m.rank + '</span>' +
    '<div class="mkt-rev-box" style="position:relative">' +
      '<div class="rank-crown">#' + m.rank + '</div>' +
      '<div>' +
        '<div class="mkt-rev-lbl">' + t('mkt_value_lbl') + '</div>' +
        '<div class="mkt-rev-amt">' + m.consumption + '</div>' +
        '<div class="mkt-rev-sub">' + m.cigars + '</div>' +
      '</div>' +
      '<div style="text-align:right">' +
        '<div style="font-size:28px">' + m.flag + '</div>' +
        '<div style="font-family:Cinzel,serif;font-size:7px;letter-spacing:.15em;color:rgba(180,220,255,.7);margin-top:2px">' + t('mkt_world_share') + '</div>' +
        '<div style="font-family:Playfair Display,serif;font-size:16px;font-weight:700;color:#7DDAFF">' + m.share + '</div>' +
      '</div>' +
    '</div>' +
    '<div class="sec">' + t('mkt_data_sec') + '</div>' +
    '<div class="srow"><span class="sk">' + t('mkt_consumption') + '</span><span class="sv">' + m.cigars + '</span></div>' +
    '<div class="srow"><span class="sk">' + t('mkt_total_value') + '</span><span class="sv">' + m.consumption + '</span></div>' +
    '<div class="srow"><span class="sk">' + t('mkt_share') + '</span><span class="sv">' + m.share + '</span></div>' +
    '<div class="srow"><span class="sk">' + t('mkt_trend') + '</span><span class="sv"><span class="' + trendClass + '">' + trendIcon + ' ' + trendDisplay + '</span></span></div>' +
    '<div class="sec">'+t('s_top_brands')+'</div>' +
    '<div class="tags">' + m.topBrands.map(function(b){ return '<span class="mkt-brand-tag">' + b + '</span>'; }).join('') + '</div>' +
    '<div class="sec">' + t('mkt_profile') + '</div>' +
    '<div class="sn">' + m.note + '</div>' +
    '<div class="sec">' + t('mkt_weight') + '</div>' +
    '<div style="background:var(--bg3);border-radius:4px;padding:12px 14px">' +
      '<div style="display:flex;justify-content:space-between;margin-bottom:8px;font-size:11px;color:var(--text2)">' +
        '<span>' + t('mkt_world_rank') + '</span>' +
        '<strong style="color:var(--text)">#' + m.rank + ' / 10</strong>' +
      '</div>' +
      '<div style="background:var(--panel-border);border-radius:3px;height:6px;overflow:hidden">' +
        '<div style="background:linear-gradient(to right,#1A6BB5,#5AACF0);height:100%;width:' + barW + '%;border-radius:3px"></div>' +
      '</div>' +
    '</div>';

  // Left lexicon panel
  document.getElementById('lexFlag').textContent = m.flag;
  document.getElementById('lexName').textContent = m.name;
  document.getElementById('lexReg').textContent  = t('mkt_consumer') + m.rank;
  document.getElementById('lexBody').innerHTML =
    '<div class="lex-coords" style="border-color:rgba(26,107,181,.35);color:#1A6BB5">' +
      '🌍 Rang #' + m.rank + ' — Part ' + m.share +
    '</div>' +
    '<div class="lex-sec">' + t('mkt_lex_data') + '</div>' +
    '<div class="lex-row"><span class="lex-k">' + t('mkt_lex_value') + '</span><span class="lex-v">' + m.consumption + '</span></div>' +
    '<div class="lex-row"><span class="lex-k">' + t('mkt_lex_volume') + '</span><span class="lex-v">' + m.cigars + '</span></div>' +
    '<div class="lex-row"><span class="lex-k">' + t('mkt_share') + '</span><span class="lex-v">' + m.share + '</span></div>' +
    '<div class="lex-row"><span class="lex-k">' + t('mkt_trend') + '</span><span class="lex-v">' + m.trend + '</span></div>' +
    '<div class="lex-sec">'+t('s_top_brands')+'</div>' +
    m.topBrands.map(function(b){
      return '<div class="lex-zone-item"><div class="lex-zone-dot" style="background:#1A6BB5"></div>' +
             '<div class="lex-zone-name">' + b + '</div></div>';
    }).join('') +
    '<div class="lex-sec">' + t('mkt_lex_profile') + '</div>' +
    '<div style="font-size:10px;color:var(--text2);line-height:1.6;padding:4px 0">' + m.note + '</div>';

  document.getElementById('lex').classList.add('open');
  document.getElementById('panel').classList.add('open');
  document.getElementById('flag-bg').classList.add('visible');
  flyToCountry(m);
  autoRot = false;
}





