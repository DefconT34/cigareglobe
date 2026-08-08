/* fiche-partage.js */
// fiche-partage.js — La fiche d'une marque, en image partageable
//
// ════════════════════════════════════════════════════════
// Partager une URL, c'est partager un lien. Le destinataire voit une
// ligne bleue dans son fil et décide en une seconde s'il clique.
//
// Ici on lui envoie l'ARTICLE lui-même : une image lisible telle quelle,
// dans la conversation, sans clic. Le lien l'accompagne pour qui veut
// lire la suite — il ne le remplace pas.
//
// La fiche reprend au pixel près la typographie de la modale, parce
// qu'une image de partage qui ne ressemble pas au site n'a pas l'air
// d'en venir :
//
//   surtitre   Cinzel 400, interlettrage .45em, or        (--gold)
//   nom        Playfair Display 900                       (--text)
//   fondation  Playfair Display italique                  (--text2)
//   corps      Lato 400, interligne 1.75                  (--text)
//   fond       crème du thème clair                       (--bg)
//
// Le thème clair est imposé, quel que soit celui du visiteur : une
// carte de partage est vue par d'autres, dans des fils qui sont blancs.
// Une fiche en thème « Minuit » y ferait un trou noir.
//
// FORMAT 1080 × 1350 (4:5). C'est le portrait le plus haut qu'Instagram,
// WhatsApp et LinkedIn affichent sans recadrer. Un carré gaspille de la
// hauteur, un 9:16 se fait rogner ailleurs que dans les stories.
// ════════════════════════════════════════════════════════

(function () {
  'use strict';

  var L = 1080, H = 1350;       // le rendu, en pixels réels
  var M = 96;                   // marge intérieure

  /** Couleurs du thème CLAIR, lues une fois, indépendamment du thème actif. */
  function palette() {
    // On ne peut pas lire les variables du thème courant : le visiteur
    // peut être en sombre. Les valeurs du thème clair sont donc citées
    // ici — c'est une duplication assumée, et le commentaire de
    // themes.css la signale en retour.
    return {
      fond:   '#F8F5EE',   // --bg
      carte:  '#FFFFFF',   // --panel-bg
      texte:  '#2A1F14',   // --text
      texte2: '#6B6560',   // --text2
      or:     '#7A5200',   // --gold
      orPale: '#F5E8C0',   // --gold-p
      trait:  '#B0ADA6',   // --panel-border
    };
  }

  /**
   * Découpe un texte en lignes qui tiennent dans une largeur.
   * measureText est le seul juge : compter les caractères se trompe dès
   * qu'une police est proportionnelle, et toutes le sont ici.
   */
  function lignes(ctx, texte, largeur, maxLignes) {
    var mots = String(texte || '').replace(/\s+/g, ' ').trim().split(' ');
    var out = [], courante = '';
    for (var i = 0; i < mots.length; i++) {
      var essai = courante ? courante + ' ' + mots[i] : mots[i];
      if (ctx.measureText(essai).width > largeur && courante) {
        out.push(courante);
        courante = mots[i];
        if (maxLignes && out.length === maxLignes) return { lignes: out, reste: true };
      } else {
        courante = essai;
      }
    }
    if (courante) out.push(courante);
    return { lignes: out, reste: false };
  }

  /** Trait fin, comme les séparateurs de section de la modale. */
  function filet(ctx, x, y, l, couleur) {
    ctx.fillStyle = couleur;
    ctx.fillRect(x, y, l, 1);
  }

  /**
   * Dessine la fiche et rend un Blob PNG.
   * @param {object} b   marque (BRANDS_DB)
   * @param {object} ctx pays d'origine { flag, name }
   */
  async function dessiner(b, pays) {
    var c = palette();
    var cv = document.createElement('canvas');
    cv.width = L; cv.height = H;
    var g = cv.getContext('2d');

    // Les polices doivent être PRÊTES : un canvas dessiné avant leur
    // chargement retombe sur une police système, et la fiche ne
    // ressemble plus au site. document.fonts.load force le chargement
    // des graisses exactes qu'on va utiliser.
    if (document.fonts && document.fonts.load) {
      try {
        await Promise.all([
          document.fonts.load('900 74px "Playfair Display"'),
          document.fonts.load('italic 400 26px "Playfair Display"'),
          document.fonts.load('400 22px "Cinzel"'),
          document.fonts.load('400 27px "Lato"'),
          document.fonts.load('700 27px "Lato"'),
        ]);
      } catch (e) { /* police indisponible : le repli système fera l'affaire */ }
    }

    // ── Fond ─────────────────────────────────────────────
    g.fillStyle = c.fond;
    g.fillRect(0, 0, L, H);
    // Bandeau or en tête, signature discrète de la marque du site
    g.fillStyle = c.or;
    g.fillRect(0, 0, L, 10);

    var y = M + 40;
    var largeur = L - M * 2;
    var rtl = document.documentElement.dir === 'rtl';
    g.textAlign = rtl ? 'right' : 'left';
    g.direction  = rtl ? 'rtl' : 'ltr';
    var x = rtl ? L - M : M;

    // ── Surtitre : MAISON · PAYS ─────────────────────────
    g.font = '400 22px "Cinzel", serif';
    g.fillStyle = c.or;
    // PAS de drapeau emoji ici. Le DOM sait le rendre — mal sous Windows,
    // qui affiche les deux lettres — mais un canvas n'y arrive pas du
    // tout : les « indicateurs régionaux » sortent en losanges vides.
    // Or l'image est produite sur le poste du visiteur : un Windows
    // partagerait une fiche ornée de « ◆◆◆◆ ». Le nom du pays dit la
    // même chose, partout.
    var surtitre = (t('bm_maison') || 'MAISON') + ' · '
                 + ((pays && pays.name) ? pays.name.toUpperCase() : '');
    // L'interlettrage n'existe pas sur canvas : on le pose lettre à lettre.
    (function espace(txt, ecart) {
      var cx = x;
      for (var i = 0; i < txt.length; i++) {
        g.fillText(txt[i], cx, y);
        cx += (g.measureText(txt[i]).width + ecart) * (rtl ? -1 : 1);
      }
    })(surtitre, 6);
    y += 62;

    // ── Nom de la maison ─────────────────────────────────
    g.font = '900 74px "Playfair Display", serif';
    g.fillStyle = c.texte;
    var nomL = lignes(g, b.name, largeur, 2).lignes;
    nomL.forEach(function (l) { g.fillText(l, x, y); y += 82; });

    // ── Fondation ────────────────────────────────────────
    if (b.founded) {
      g.font = 'italic 400 28px "Playfair Display", serif';
      g.fillStyle = c.texte2;
      g.fillText(String(b.founded), x, y);
      y += 30;
    }

    y += 30;
    filet(g, M, y, largeur, c.or);
    y += 56;

    // ── L'histoire ───────────────────────────────────────
    // C'est le cœur de la fiche : tout le reste lui laisse la place.
    // On calcule d'abord ce qui tient, et on ferme sur une phrase.
    g.font = '400 27px "Lato", sans-serif';
    g.fillStyle = c.texte;
    var hauteurDispo = H - y - 250;          // 250 : distinctions + pied
    var interligne = 47;                      // 27px × 1.75
    var maxL = Math.floor(hauteurDispo / interligne);
    var res = lignes(g, b.history, largeur, maxL);
    res.lignes.forEach(function (l, i) {
      // Dernière ligne tronquée : on la ferme proprement.
      if (res.reste && i === res.lignes.length - 1) {
        while (g.measureText(l + ' …').width > largeur) l = l.slice(0, -1);
        l = l.replace(/[\s,;:—-]+$/, '') + ' …';
      }
      g.fillText(l, x, y);
      y += interligne;
    });

    // ── Une distinction, s'il y en a une ─────────────────
    var meilleur = (b.scores || []).slice().sort(function (a, z) { return z.score - a.score; })[0];
    if (meilleur) {
      y = H - 216;
      var badgeL = 300, badgeH = 78;
      var bx = rtl ? L - M - badgeL : M;
      g.fillStyle = c.orPale;
      g.fillRect(bx, y - 52, badgeL, badgeH);
      g.fillStyle = c.or;
      g.fillRect(bx, y - 52, 5, badgeH);
      g.textAlign = 'left'; g.direction = 'ltr';
      g.font = '900 40px "Playfair Display", serif';
      g.fillText(meilleur.score === 100 ? '100' : String(meilleur.score), bx + 26, y);
      g.font = '400 19px "Lato", sans-serif';
      g.fillStyle = c.texte2;
      g.fillText(meilleur.source + ' · ' + meilleur.year, bx + 100, y - 6);
      g.textAlign = rtl ? 'right' : 'left';
      g.direction = rtl ? 'rtl' : 'ltr';
    }

    // ── Pied : la signature ──────────────────────────────
    filet(g, M, H - 118, largeur, c.trait);
    g.font = '400 24px "Cinzel", serif';
    g.fillStyle = c.or;
    (function espace(txt, ecart) {
      var cx = rtl ? L - M : M;
      for (var i = 0; i < txt.length; i++) {
        g.fillText(txt[i], cx, H - 70);
        cx += (g.measureText(txt[i]).width + ecart) * (rtl ? -1 : 1);
      }
    })('CIGAR ODYSSEY', 7);
    g.font = '400 20px "Lato", sans-serif';
    g.fillStyle = c.texte2;
    g.textAlign = rtl ? 'left' : 'right';
    g.fillText(location.host, rtl ? M : L - M, H - 70);

    return new Promise(function (res) { cv.toBlob(res, 'image/png'); });
  }

  /**
   * Partage la fiche d'une marque.
   *
   * Trois chemins, du meilleur au plus modeste :
   *   1. partage natif AVEC l'image — le destinataire voit la fiche
   *      directement dans sa conversation ;
   *   2. partage natif sans fichier (navigateurs qui refusent les
   *      fichiers) — titre, résumé et lien ;
   *   3. téléchargement de l'image, pour l'envoyer à la main.
   *
   * Le lien accompagne toujours l'image : la fiche donne envie, le lien
   * mène à l'article complet et à ses cinq autres langues.
   */
  async function partager(nom) {
    var b = (window.BRANDS_DB || {})[nom];
    if (!b) return false;
    var pays = (window.COUNTRIES || []).find(function (x) {
      return (x.brands || []).some(function (m) { return m.name === nom; });
    }) || null;

    var url = location.origin + location.pathname + '?brand=' + encodeURIComponent(nom);
    var resume = String(b.history || '').replace(/\s+/g, ' ').trim();
    if (resume.length > 200) resume = resume.slice(0, 200).replace(/[\s,;:—-]+$/, '') + '…';

    var blob = null;
    try { blob = await dessiner(b, pays); } catch (e) { blob = null; }

    if (blob && navigator.canShare) {
      var f = new File([blob], nom.replace(/[^\w-]+/g, '_') + '.png', { type: 'image/png' });
      if (navigator.canShare({ files: [f] })) {
        try {
          await navigator.share({ files: [f], title: nom + ' — CigarOdyssey', text: resume + '\n' + url });
          return true;
        } catch (e) { if (e && e.name === 'AbortError') return false; }
      }
    }
    if (navigator.share) {
      try { await navigator.share({ title: nom + ' — CigarOdyssey', text: resume, url: url }); return true; }
      catch (e) { if (e && e.name === 'AbortError') return false; }
    }
    if (blob) {
      var a = document.createElement('a');
      a.href = URL.createObjectURL(blob);
      a.download = nom.replace(/[^\w-]+/g, '_') + '.png';
      a.click();
      setTimeout(function () { URL.revokeObjectURL(a.href); }, 5000);
      return true;
    }
    return false;
  }

  window.ficheMarqueBlob = dessiner;    // exposé pour les tests
  window.partagerMarque  = partager;
})();
