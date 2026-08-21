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

  // ══ FILIGRANE ═══════════════════════════════════════════
  // Une feuille de tabac, dessinée en courbes plutôt qu'importée : une
  // image de fond serait un aller-retour réseau de plus au moment
  // précis où l'on veut partager, et le partage natif n'attend pas.
  //
  // Les nervures ne sont pas décoratives — sans elles, la silhouette se
  // lit comme une goutte. C'est le rachis et les nervures secondaires
  // qui disent « feuille ».
  //
  // Opacité 5 % : à 10 % on la voit derrière le texte, à 2 % elle
  // disparaît une fois l'image recompressée par WhatsApp.
  function feuille(g, cx, cy, taille, angle, alpha, couleur) {
    g.save();
    g.translate(cx, cy);
    g.rotate(angle);
    var W = taille * 0.33;                       // demi-largeur au plus large

    g.globalAlpha = alpha;
    g.fillStyle = couleur;
    g.beginPath();
    g.moveTo(0, 0);
    g.bezierCurveTo(W * 1.05, -taille * 0.18, W * 0.95, -taille * 0.62, 0, -taille);
    g.bezierCurveTo(-W * 0.95, -taille * 0.62, -W * 1.05, -taille * 0.18, 0, 0);
    g.closePath();
    g.fill();

    // Rachis + nervures secondaires, un peu plus marquées que le limbe.
    g.globalAlpha = alpha * 2.1;
    g.strokeStyle = couleur;
    g.lineWidth = Math.max(1, taille * 0.006);
    g.beginPath(); g.moveTo(0, -taille * 0.02); g.lineTo(0, -taille * 0.96); g.stroke();
    for (var i = 0.12; i < 0.86; i += 0.13) {
      // Les nervures sont plus longues au milieu de la feuille, comme
      // la largeur du limbe qui les porte.
      var w = W * (1 - Math.abs(i - 0.42) * 0.9);
      for (var s = -1; s <= 1; s += 2) {
        g.beginPath();
        g.moveTo(0, -taille * i);
        g.quadraticCurveTo(s * w * 0.55, -taille * (i + 0.05), s * w * 0.82, -taille * (i + 0.14));
        g.stroke();
      }
    }
    g.restore();
  }

  /** Trois feuilles en fond, posées dans les angles que le texte n'occupe pas. */
  function filigrane(g, c) {
    feuille(g, L + 60, H + 80, 700, -0.60, 0.050, c.or);   // grande, angle bas-droit
    feuille(g, L + 60, -80,    520, -2.50, 0.045, c.or);   // haut-droit, retombante
    feuille(g, -60,    H + 40, 400,  0.60, 0.045, c.or);   // bas-gauche, petite
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

  /** L'interlettrage n'existe pas sur canvas : on le pose lettre à lettre. */
  function interlettre(g, txt, x, y, ecart, rtl) {
    var cx = x;
    for (var i = 0; i < txt.length; i++) {
      g.fillText(txt[i], cx, y);
      cx += (g.measureText(txt[i]).width + ecart) * (rtl ? -1 : 1);
    }
  }

  /** Les libellés du site portent un emoji ; la fiche est en or et en Cinzel. */
  function sansEmoji(s) {
    return String(s || '').replace(/[\u{1F000}-\u{1FAFF}\u{2600}-\u{27BF}\u{FE0F}]/gu, '').trim();
  }

  // ══ LES DISTINCTIONS ════════════════════════════════════
  // Le bas de la fiche était vide sous l'histoire, avec une seule
  // médaille posée dans le blanc. Les notes sont pourtant ce qui donne
  // sa valeur à la maison — elles ferment la fiche, en grille, comme
  // dans l'article.
  var DIST_MAX = 6;             // deux colonnes, trois rangs
  var DIST_TITRE = 46;          // hauteur du titre de section
  var DIST_ITEM = 76, DIST_GAP = 14;

  function distHauteur(n) {
    if (!n) return 0;
    var rangs = Math.ceil(n / 2);
    return DIST_TITRE + rangs * DIST_ITEM + (rangs - 1) * DIST_GAP;
  }

  function distDessiner(g, c, liste, y, rtl) {
    var largeur = L - M * 2;
    var colL = (largeur - 24) / 2;

    g.font = '400 22px "Cinzel", serif';
    g.fillStyle = c.or;
    g.textAlign = rtl ? 'right' : 'left';
    interlettre(g, sansEmoji(t('bm_distinctions')).toUpperCase(), rtl ? L - M : M, y, 5, rtl);
    y += DIST_TITRE - 12;

    liste.forEach(function (s, i) {
      var col = i % 2, rang = Math.floor(i / 2);
      var bx = rtl
        ? L - M - colL - col * (colL + 24)
        : M + col * (colL + 24);
      var by = y + rang * (DIST_ITEM + DIST_GAP);

      g.fillStyle = c.orPale;
      g.fillRect(bx, by, colL, DIST_ITEM);
      g.fillStyle = c.or;
      g.fillRect(rtl ? bx + colL - 5 : bx, by, 5, DIST_ITEM);   // le liseré, côté marge

      // Un 100/100 s'écrit « 100 » : le pictogramme du site ne
      // survivrait pas au canvas, et le chiffre est plus fort.
      var xNote = rtl ? bx + colL - 26 : bx + 26;
      var xInfo = rtl ? bx + colL - 112 : bx + 112;
      g.textAlign = rtl ? 'right' : 'left';
      g.font = '900 42px "Playfair Display", serif';
      g.fillStyle = c.texte;
      g.fillText(String(s.score), xNote, by + 54);

      g.font = '700 20px "Lato", sans-serif';
      g.fillStyle = c.texte;
      var titre = lignes(g, s.source + ' · ' + s.year, colL - 136, 1).lignes[0] || '';
      g.fillText(titre, xInfo, s.vitola ? by + 34 : by + 46);
      if (s.vitola) {
        g.font = '400 18px "Lato", sans-serif';
        g.fillStyle = c.texte2;
        var v = lignes(g, s.vitola, colL - 136, 1);
        g.fillText(v.reste ? v.lignes[0] + '…' : v.lignes[0], xInfo, by + 60);
      }
    });
  }

  /**
   * Dessine la fiche et rend un Blob PNG.
   * @param {object} b    marque (BRANDS_DB)
   * @param {object} pays pays d'origine { flag, name }
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
    filigrane(g, c);                    // avant tout le reste : c'est un fond
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
    // Le meme fait est ecrit a deux endroits — ici et dans la modale —
    // et c'est le piege du lot 5 : corriger l'un laisse l'autre mentir.
    // Une entree `cape` n'est pas une maison de ce pays ; l'image
    // partagee doit le dire comme l'ecran.
    var surtitre = (t(window._capeCourante ? 'bm_cape' : 'bm_maison') || 'MAISON') + ' · '
                 + ((pays && pays.name) ? pays.name.toUpperCase() : '');
    interlettre(g, surtitre, x, y, 6, rtl);
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

    // ── Ce que le bas réserve ────────────────────────────
    // On réserve la place des distinctions AVANT de couler l'histoire :
    // c'est le texte qui s'adapte à la grille, jamais l'inverse. Sans
    // distinction, l'histoire récupère toute la hauteur.
    var dist = (b.scores || []).slice()
      .sort(function (a, z) { return z.score - a.score; })
      .slice(0, DIST_MAX);
    var blocH = distHauteur(dist.length);
    var yPied = H - 118;                          // le filet du pied
    var yDist = yPied - 52 - blocH;
    var hauteurDispo = yDist - 46 - y;

    // ── L'histoire ───────────────────────────────────────
    g.font = '400 27px "Lato", sans-serif';
    g.fillStyle = c.texte;
    var interligne = 47;                          // 27px × 1.75
    var maxL = Math.max(1, Math.floor(hauteurDispo / interligne));
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

    // ── Les distinctions ─────────────────────────────────
    if (dist.length) distDessiner(g, c, dist, yDist + 22, rtl);

    // ── Pied : la signature ──────────────────────────────
    g.textAlign = rtl ? 'right' : 'left';
    g.direction = rtl ? 'rtl' : 'ltr';
    filet(g, M, yPied, largeur, c.trait);
    g.font = '400 24px "Cinzel", serif';
    g.fillStyle = c.or;
    interlettre(g, 'CIGAR ODYSSEY', rtl ? L - M : M, H - 70, 7, rtl);
    g.font = '400 20px "Lato", sans-serif';
    g.fillStyle = c.texte2;
    g.textAlign = rtl ? 'left' : 'right';
    g.fillText(location.host, rtl ? M : L - M, H - 70);

    return new Promise(function (res) { cv.toBlob(res, 'image/png'); });
  }

  // ══ LE PARTAGE ══════════════════════════════════════════
  // Sur téléphone, le bon partage est celui du SYSTÈME : la feuille
  // native connaît les applications installées, les contacts récents et
  // les conventions de la plateforme. Rien de ce qu'on écrirait ne
  // ferait mieux.
  //
  // Encore faut-il y arriver. navigator.share() exige une « activation
  // transitoire » : l'appel doit partir du geste de l'utilisateur. Or
  // dessiner la fiche demande de charger cinq polices puis d'encoder un
  // PNG de 230 Ko — bien assez pour que Safari considère le geste
  // périmé et refuse le partage. Une fiche parfaite qu'on ne peut pas
  // envoyer ne sert à rien.
  //
  // D'où la préparation en amont : la fiche est dessinée dès que
  // l'article est affiché, pendant que le visiteur lit. Au moment du
  // geste, l'image est là, et share() part sans le moindre await.
  var _cache = { nom: null, blob: null, encours: null };

  function preparer(nom, cid) {
    if (_cache.nom === nom && (_cache.blob || _cache.encours)) return _cache.encours;
    var b = (window.BRANDS_DB || {})[nom];
    if (!b) return null;
    _cache = { nom: nom, blob: null, encours: null };
    var p = dessiner(b, paysDe(nom, cid))
      .then(function (blob) { if (_cache.nom === nom) _cache.blob = blob; return blob; })
      .catch(function () { return null; });
    _cache.encours = p;
    return p;
  }

  function paysDe(nom, cid) {
    var pays = (window.COUNTRIES || []);
    return (cid && pays.find(function (x) { return x.id === cid; }))
      || pays.find(function (x) {
           return (x.brands || []).some(function (m) { return m.name === nom; });
         })
      || null;
  }

  function fichier(blob, nom) {
    return new File([blob], nom.replace(/[^\w-]+/g, '_') + '.png', { type: 'image/png' });
  }

  function telecharger(blob, nom) {
    if (!blob) return false;
    var a = document.createElement('a');
    a.href = URL.createObjectURL(blob);
    a.download = nom.replace(/[^\w-]+/g, '_') + '.png';
    a.click();
    setTimeout(function () { URL.revokeObjectURL(a.href); }, 5000);
    return true;
  }

  /**
   * Envoie la fiche. AUCUN await avant navigator.share() : c'est la
   * condition pour que le geste de l'utilisateur compte encore.
   *
   * Trois chemins, du meilleur au plus modeste :
   *   1. partage natif AVEC l'image — la fiche apparaît dans la
   *      conversation, lisible sans clic ;
   *   2. partage natif sans fichier (navigateurs qui refusent les
   *      fichiers) — titre, résumé et lien ;
   *   3. téléchargement de l'image, pour l'envoyer à la main.
   *
   * Le lien accompagne toujours l'image : la fiche donne envie, le lien
   * mène à l'article complet et à ses cinq autres langues.
   */
  function envoyer(nom, blob, resume, url) {
    var titre = nom + ' — CigarOdyssey';
    if (blob && navigator.canShare && navigator.share) {
      var f = fichier(blob, nom);
      if (navigator.canShare({ files: [f] })) {
        return navigator.share({ files: [f], title: titre, text: resume + '\n' + url })
          .then(function () { return true; })
          .catch(function (e) {
            if (e && e.name === 'AbortError') return false;
            return telecharger(blob, nom);
          });
      }
    }
    if (navigator.share) {
      return navigator.share({ title: titre, text: resume, url: url })
        .then(function () { return true; })
        .catch(function (e) {
          if (e && e.name === 'AbortError') return false;
          return telecharger(blob, nom);
        });
    }
    return Promise.resolve(telecharger(blob, nom));
  }

  function partager(nom, cid) {
    var b = (window.BRANDS_DB || {})[nom];
    if (!b) return Promise.resolve(false);

    var url = location.origin + location.pathname + '?brand=' + encodeURIComponent(nom);
    var resume = String(b.history || '').replace(/\s+/g, ' ').trim();
    if (resume.length > 200) resume = resume.slice(0, 200).replace(/[\s,;:—-]+$/, '') + '…';

    // Fiche déjà prête : on part dans le geste, sans une seule micro-tâche.
    if (_cache.nom === nom && _cache.blob) return envoyer(nom, _cache.blob, resume, url);

    // Sinon on la dessine — le partage natif refusera peut-être, le
    // téléchargement prendra alors le relais.
    return (preparer(nom, cid) || Promise.resolve(null))
      .then(function (blob) { return envoyer(nom, blob, resume, url); });
  }

  window.ficheMarqueBlob   = dessiner;    // exposé pour les tests
  window.preparerFicheMarque = preparer;
  window.partagerMarque    = partager;
})();
