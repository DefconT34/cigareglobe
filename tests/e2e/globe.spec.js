// ════════════════════════════════════════════════════════
// globe.spec.js — Chargement du globe et colonne de boutons
// ════════════════════════════════════════════════════════

const { test, expect } = require('@playwright/test');
const { ouvrir, collecteErreurs } = require('./aide');

test.describe('Globe', () => {

  test('se charge sans erreur console et peint le canvas', async ({ page }) => {
    // Les coupures reseau du serveur de developpement sont ecartees ;
    // les exceptions JavaScript, jamais (voir aide.js).
    const erreurs = collecteErreurs(page);

    await ouvrir(page, '/');
    await expect(page.locator('#globe')).toBeVisible();

    // Le canvas doit contenir des pixels : un globe non peint passerait
    // sinon inapercu, l'element etant present mais vide.
    await expect.poll(async () => page.evaluate(() => {
      const c = document.getElementById('globe');
      const d = c.getContext('2d').getImageData(0, 0, c.width, c.height).data;
      let n = 0;
      for (let i = 3; i < d.length; i += 4 * 97) if (d[i] > 8) n++;   // echantillonnage
      return n;
    }), { timeout: 15_000, message: 'le globe ne peint rien' }).toBeGreaterThan(100);

    expect(erreurs).toEqual([]);
  });

  test('charge les donnees de l\'atlas depuis l\'API', async ({ page }) => {
    await ouvrir(page, '/');
    const compte = await page.evaluate(() => ({
      pays:     (window.COUNTRIES || []).length,
      marches:  (window.MARKETS || []).length,
      lounges:  (window.LOUNGE_COUNTRIES || []).length,
    }));
    expect(compte.marches).toBeGreaterThan(5);
    expect(compte.lounges).toBeGreaterThan(50);
  });

  // ── Regression : commit c0e57da ──────────────────────
  // Les quatre boutons flottants etaient positionnes par des offsets
  // « bottom » codes en dur dans quatre fichiers ; les valeurs avaient
  // derive jusqu'a 0 px d'ecart entre deux d'entre eux.
  test.describe('colonne de boutons flottants', () => {

    test('les boutons partagent taille, axe et ecart', async ({ page }) => {
      await ouvrir(page, '/');
      const colonne = page.locator('#side-fabs');
      await expect(colonne).toBeVisible();
      // Les boutons 🔍, 🗺 et ⟳ sont injectes par leurs modules. Le
      // gyroscope, lui, n'apparait que sur un appareil tactile : quatre
      // boutons ici, cinq sur le projet mobile.
      await expect(colonne.locator('.side-fab')).toHaveCount(4);

      const boutons = await page.evaluate(() => {
        const els = [...document.querySelectorAll('#side-fabs .side-fab')];
        return els.map((el) => {
          const r = el.getBoundingClientRect();
          return { id: el.id, l: Math.round(r.left), t: Math.round(r.top),
                   b: Math.round(r.bottom), w: Math.round(r.width), h: Math.round(r.height) };
        }).sort((a, b) => a.t - b.t);
      });

      // Meme taille
      const tailles = new Set(boutons.map((b) => `${b.w}x${b.h}`));
      expect(tailles.size, `tailles divergentes : ${[...tailles].join(', ')}`).toBe(1);

      // Meme axe vertical
      const axes = new Set(boutons.map((b) => b.l + b.w / 2));
      expect(axes.size, `axes divergents : ${[...axes].join(', ')}`).toBe(1);

      // Ecarts constants et non nuls
      const ecarts = boutons.slice(1).map((b, i) => b.t - boutons[i].b);
      expect(new Set(ecarts).size, `ecarts irreguliers : ${ecarts.join(', ')}`).toBe(1);
      expect(ecarts[0]).toBeGreaterThan(0);
    });

    test('les quatre boutons sont cliquables', async ({ page }) => {
      await ouvrir(page, '/');
      await expect(page.locator('#side-fabs .side-fab')).toHaveCount(4);

      const masques = await page.evaluate(() => {
        return [...document.querySelectorAll('#side-fabs .side-fab')]
          .filter((el) => {
            const r = el.getBoundingClientRect();
            return document.elementFromPoint(r.left + r.width / 2, r.top + r.height / 2) !== el;
          }).map((el) => el.id);
      });
      expect(masques, 'boutons recouverts par un autre element').toEqual([]);
    });
  });

  // ── Regression : commit e4ce434 ──────────────────────
  // #tip declarait « transition:opacity » sans jamais declarer
  // « opacity » : l'infobulle vide restait peinte au coin haut-gauche.
  test.describe('infobulle', () => {

    test('est invisible au chargement', async ({ page }) => {
      await ouvrir(page, '/');
      const tip = page.locator('#tip');
      await expect(tip).toBeHidden();

      const etat = await page.evaluate(() => {
        const s = getComputedStyle(document.getElementById('tip'));
        return { opacite: s.opacity, visibilite: s.visibility };
      });
      expect(etat).toEqual({ opacite: '0', visibilite: 'hidden' });
    });

    test('apparait au survol d\'un pays puis disparait', async ({ page }) => {
      await ouvrir(page, '/');
      // On vise le centre du globe en balayant jusqu'a toucher une cible :
      // la rotation initiale n'est pas garantie.
      const touche = await page.evaluate(async () => {
        const c = document.getElementById('globe');
        const r = c.getBoundingClientRect();
        for (let i = 0; i < 400; i++) {
          const x = r.left + r.width * (0.3 + 0.4 * Math.random());
          const y = r.top + r.height * (0.3 + 0.4 * Math.random());
          if (typeof hitTest === 'function' && hitTest(x, y)) return { x, y };
        }
        return null;
      });
      test.skip(!touche, 'aucune cible trouvee sur la face visible du globe');

      await page.mouse.move(touche.x, touche.y);
      await expect(page.locator('#tip')).toBeVisible();
      await expect(page.locator('#tip')).not.toBeEmpty();

      // Hors du globe : l'infobulle se retire
      await page.mouse.move(5, 700);
      await expect(page.locator('#tip')).toBeHidden();
    });

    // Regression : le gestionnaire de mousemove vit sur `window`, pas sur
    // le canvas — il le faut, sinon un glisser se fige des que la souris
    // sort du globe. Mais hitTest() ne connait que des coordonnees
    // d'ecran : il repondait aussi bien SOUS un panneau, et l'infobulle
    // decrivait un marqueur cache derriere l'interface.
    test('reste masquee quand le curseur survole un panneau', async ({ page }) => {
      await ouvrir(page, '/?country=cuba');
      await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });

      // Un point qui est A LA FOIS dans le panneau et sur une cible du
      // globe : sans cette double condition, le test passerait meme si
      // le defaut etait intact.
      const point = await page.evaluate(() => {
        const p = document.getElementById('panel').getBoundingClientRect();
        for (let x = Math.ceil(p.left) + 4; x < p.right - 4; x += 3) {
          for (let y = Math.ceil(p.top) + 4; y < p.bottom - 4; y += 3) {
            if (hitTest(x, y)) return { x, y };
          }
        }
        return null;
      });
      test.skip(!point, 'aucune cible du globe ne passe sous le panneau');

      await page.mouse.move(point.x, point.y);
      await expect(page.locator('#tip')).toBeHidden();

      // Et le survol reste nul : sans cela le marqueur cache resterait
      // mis en avant dans le rendu, invisiblement.
      const survol = await page.evaluate(() => ({
        pays: hoverCountry, marche: hoverMarket, lounges: hoverLoungeCountry,
      }));
      expect(survol).toEqual({ pays: null, marche: null, lounges: null });
    });

    test('le glisser continue de suivre la souris hors du globe', async ({ page }) => {
      await ouvrir(page, '/?country=cuba');
      await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });

      const avant = await page.evaluate(() => ({ x: rotX, y: rotY }));
      await page.mouse.move(250, 400);
      await page.mouse.down();
      // La souris sort du globe et traverse le panneau, comme dans un
      // vrai geste : la rotation doit continuer de suivre.
      await page.mouse.move(400, 380);
      await page.mouse.move(700, 320);
      const apres = await page.evaluate(() => ({ x: rotX, y: rotY }));
      await page.mouse.up();

      expect(apres).not.toEqual(avant);
      await expect(page.locator('#tip')).toBeHidden();
    });
  });

  // ── Rebond du marqueur selectionne ────────────────────
  test.describe('rebond du marqueur', () => {

    test('un seul marqueur est souleve, jamais les autres', async ({ page }) => {
      await ouvrir(page, '/?country=cuba');
      await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });

      // On espionne gc.translate : c'est le SEUL mecanisme qui deplace
      // un marqueur. Compter les appels prouve directement qu'aucun
      // autre marqueur ne bouge — une capture d'ecran ne le dirait pas.
      const frames = await page.evaluate(() => {
        const vraiT = gc.translate, vraiNow = Date.now, base = 1700000000000;
        let decalages = [];
        gc.translate = function (x, y) {
          if (x === 0 && y !== 0) decalages.push(Math.round(y * 10) / 10);
          return vraiT.apply(gc, arguments);
        };
        const out = [0.25, 0.60, 0.90].map((ph) => {
          decalages = [];
          Date.now = () => base + Math.round(ph * BOND_PERIODE);
          drawGlobe();
          return { phase: ph, decalages: decalages.slice() };
        });
        Date.now = vraiNow; gc.translate = vraiT;
        return out;
      });

      for (const f of frames) {
        expect(f.decalages.length,
               `phase ${f.phase} : ${f.decalages.length} marqueur(s) souleve(s)`)
          .toBeLessThanOrEqual(1);
        for (const d of f.decalages) expect(d).toBeLessThan(0);   // vers le haut
      }
      // Au moins une phase souleve reellement, sinon le test ne prouve rien.
      expect(frames.some((f) => f.decalages.length === 1)).toBe(true);
      // Et au moins une le repose : c'est la pause qui distingue un
      // rebond d'un clignotement perpetuel.
      expect(frames.some((f) => f.decalages.length === 0)).toBe(true);
    });

    test('aucun mouvement si l\'utilisateur demande moins d\'animations', async ({ page }) => {
      await ouvrir(page, '/?country=cuba');
      const hauteurs = await page.evaluate(() => {
        const sauv = _reduceMotion;
        _reduceMotion = true;
        const h = [0, 0.25, 0.5, 0.75].map((ph) => {
          const vraiNow = Date.now;
          Date.now = () => 1700000000000 + Math.round(ph * BOND_PERIODE);
          const v = bondSelection();
          Date.now = vraiNow;
          return v;
        });
        _reduceMotion = sauv;
        return h;
      });
      // Zero, pas « constant » : une valeur figee non nulle laisserait le
      // marqueur suspendu en l'air, ce qui serait pire que l'animation.
      expect(hauteurs).toEqual([0, 0, 0, 0]);
    });
  });

  // ── La rotation automatique ────────────────────────────
  // REGRESSION, et elle etait totale : `autoRot` existait depuis le
  // premier jour, mais la boucle incrementait `rotY` puis, ligne
  // suivante, ramenait `rotY` vers `targetY` — qui ne bougeait pas. Les
  // deux se combattaient et l'equilibre se calcule :
  //
  //     0.0008 = 0.08 x (rotY - targetY)   ->   ecart = 0.01 rad
  //
  // Le globe s'ecartait de 0,57 degre... et s'arretait la. La rotation
  // automatique n'a jamais tourne ; elle etait un fremissement d'un
  // demi-degre au chargement, que personne ne remarquait.
  //
  // Le parcours mesure donc une VITESSE, pas un deplacement : c'est la
  // seule facon de distinguer « ca tourne » de « ca a fremi puis s'est
  // arrete ». Et comme la vitesse est desormais fondee sur le TEMPS et
  // non sur le nombre d'images, la fourchette vaut quelle que soit la
  // cadence de la machine de test — un navigateur sans acceleration
  // materielle descend a 11 images par seconde, et doit tourner a la
  // meme vitesse qu'a 60.
  test('le globe tourne vraiment, et le bouton l\'arrete', async ({ page }) => {
    await ouvrir(page, '/');
    await expect(page.locator('#rotate-btn')).toBeVisible({ timeout: 20_000 });

    // La position affichee (`rotY`) suit la cible avec un lissage : au
    // demarrage elle accelere pendant environ une seconde avant
    // d'atteindre la vitesse de croisiere. Mesurer tout de suite
    // donnerait donc un chiffre trop bas — releve : 1,2 deg/s au lieu de
    // 2,7. On laisse le mouvement s'etablir avant de chronometrer.
    const mesure = async () => page.evaluate(async () => {
      const pause = (ms) => new Promise((r) => setTimeout(r, ms));
      await pause(2000);                              // mise en regime
      const t0 = performance.now(), a = rotY;
      await pause(2500);
      const dt = (performance.now() - t0) / 1000;
      return ((rotY - a) * 180 / Math.PI) / dt;      // degres par seconde
    });

    // Etat de depart : la rotation est en marche.
    const enMarche = await mesure();
    expect(enMarche, 'le globe ne tourne pas').toBeGreaterThan(1.5);
    // Et a la bonne vitesse : 2,75 deg/s, soit un tour en ~131 s. Au-dela,
    // c'est que le pas depend a nouveau du nombre d'images.
    expect(enMarche, 'la rotation depend de la cadence d\'affichage').toBeLessThan(4.5);

    // CONTRE-EPREUVE : le bouton l'arrete pour de bon.
    await page.locator('#rotate-btn').click();
    const arrete = await mesure();
    expect(Math.abs(arrete), 'le bouton n\'arrete pas la rotation').toBeLessThan(0.05);

    // Et la relance.
    await page.locator('#rotate-btn').click();
    expect(await mesure(), 'la rotation ne repart pas').toBeGreaterThan(1.5);
  });

  // ── L'indice du premier ecran ─────────────────────────
  // Il ne s'affiche qu'une fois, s'efface au premier geste, et
  // n'intercepte aucun clic — un indice qui empeche de faire ce qu'il
  // conseille serait une farce. Les trois sont verifiees, la derniere
  // en interrogeant le point : c'est le seul moyen de distinguer
  // « transparent aux clics » de « pose ailleurs ».
  test('l\'indice dit quoi faire, une seule fois, sans gener', async ({ page }) => {
    await ouvrir(page, '/');
    const indice = page.locator('#globe-indice');
    await expect(indice).toBeVisible({ timeout: 15_000 });
    await expect(indice).toHaveText(/globe/i);

    const dessous = await indice.evaluate((el) => {
      const r = el.getBoundingClientRect();
      const sous = document.elementFromPoint(r.left + r.width / 2, r.top + r.height / 2);
      return sous ? (sous.id || sous.tagName) : null;
    });
    expect(dessous, 'l\'indice avale les clics').not.toBe('globe-indice');

    // Le premier geste l'efface, et le poste s'en souvient. Le point
    // vise le bas du canvas : l'en-tete couvre son coin superieur.
    await page.locator('#globe').click({ position: { x: 40, y: 600 } });
    await expect(indice).toHaveCount(0, { timeout: 5_000 });
    expect(await page.evaluate(() => localStorage.getItem('cg_indice_globe'))).toBe('vu');

    // CONTRE-EPREUVE : au retour, il ne revient pas.
    await page.reload();
    await expect(page.locator('#globe')).toBeVisible();
    await page.waitForTimeout(1500);
    await expect(page.locator('#globe-indice')).toHaveCount(0);
  });

  // Arriver par un lien partage ouvre deja une fiche : expliquer le
  // globe a ce moment-la, c'est expliquer une porte a quelqu'un qui est
  // deja entre.
  test('l\'indice se tait sur un lien partage', async ({ page }) => {
    await ouvrir(page, '/?country=cuba');
    await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });
    await expect(page.locator('#globe-indice')).toHaveCount(0);
  });
});
