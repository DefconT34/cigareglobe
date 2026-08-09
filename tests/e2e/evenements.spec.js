// ════════════════════════════════════════════════════════
// evenements.spec.js — Les rendez-vous (V2)
// ────────────────────────────────────────────────────────
// Le jeu de donnees pose DEUX rendez-vous : un a venir, un passe
// (tests/setup_front_db.php). C'est ce qui rend la bascule
// « a venir / archives » verifiable — avec un seul, les deux etats
// afficheraient la meme chose et le parcours ne dirait rien.
//
// Cahier des charges : docs/communaute.md §6
// ════════════════════════════════════════════════════════

const { test, expect } = require('@playwright/test');
const { ouvrir, collecteErreurs } = require('./aide');

async function ouvrirAgenda(page) {
  await page.locator('#forumBtn').click();
  await expect(page.locator('.fo-sec')).toHaveCount(8, { timeout: 15_000 });
  await page.locator('.fo-sec[data-sec="rencontres"]').click();
  await expect(page.locator('.fo-evt').first()).toBeVisible({ timeout: 15_000 });
}

test.describe('Rendez-vous', () => {

  // ── L'agenda, pas une liste de sujets ──────────────────
  // Dans cette rubrique le tri utile n'est pas la derniere reponse mais
  // la date qui vient : d'ou la pastille de date en tete de ligne.
  test('la rubrique Rencontres affiche un agenda', async ({ page }) => {
    await ouvrir(page, '/');
    await ouvrirAgenda(page);

    await expect(page.locator('.fo-evt-date')).toHaveCount(1);
    await expect(page.locator('.fo-topic').first()).toContainText('Degustation de rentree');

    // Le lieu, la nature et les places accompagnent la date : on decide
    // d'y aller sans avoir a ouvrir le fil. Le lieu attendu est celui que
    // sert l'API — un rendez-vous rattache a un etablissement de l'atlas
    // prend SON nom, et pas l'adresse libre saisie a cote.
    const attendu = await page.evaluate(async () => {
      const r = await (await fetch('/backend/forum.php?action=agenda&lang=all')).json();
      return (r.events || [])[0] || {};
    });
    expect(attendu.lounge_id, 'le rendez-vous doit etre rattache a un etablissement').toBeTruthy();
    await expect(page.locator('.fo-topic').first()).toContainText(attendu.place);
    await expect(page.locator('.fo-topic').first()).toContainText(/D.gustation/i);
    await expect(page.locator('.fo-topic').first()).toContainText('1/12');
  });

  test('la bascule « archives » cache et remontre, dans les deux sens', async ({ page }) => {
    await ouvrir(page, '/');
    await ouvrirAgenda(page);

    const titres = () => page.locator('.fo-t-title').allTextContents();
    expect((await titres()).join(' ')).toContain('Degustation de rentree');
    expect((await titres()).join(' '),
           'un rendez-vous passe n\'a rien a faire dans l\'agenda').not.toContain('printemps');

    await page.locator('.fo-quand').selectOption('passes');
    await expect(page.locator('.fo-evt').first()).toBeVisible({ timeout: 15_000 });
    expect((await titres()).join(' ')).toContain('printemps');
    // CONTRE-EPREUVE : le rendez-vous a venir quitte l'affichage.
    expect((await titres()).join(' ')).not.toContain('Degustation de rentree');
  });

  // ── La fiche, en tete du fil ───────────────────────────
  test('le fil d\'un rendez-vous porte sa date, son lieu et ses places', async ({ page }) => {
    const erreurs = collecteErreurs(page);
    await ouvrir(page, '/?sujet=910');
    await expect(page.locator('.fo-evt-fiche')).toBeVisible({ timeout: 15_000 });

    const place = await page.evaluate(async () => {
      const r = await (await fetch('/backend/forum.php?action=topic&id=910')).json();
      return (r.event || {}).place;
    });
    await expect(page.locator('.fo-evt-ou')).toContainText(place);
    // Une place prise sur douze : l'organisateur vient, par construction.
    await expect(page.locator('.fo-evt-meta').first()).toContainText('1/12');
    // Le message est rendu par le serveur, Markdown compris.
    await expect(page.locator('.fo-p-corps strong').first()).toHaveText('Behike');
    expect(erreurs, 'erreurs de console').toEqual([]);
  });

  test('un visiteur ne peut pas organiser, et on lui dit pourquoi', async ({ page }) => {
    await ouvrir(page, '/');
    await ouvrirAgenda(page);
    await expect(page.locator('.fo-new-evt')).toHaveCount(0);
    await expect(page.locator('.fo-evt-note')).toContainText(/confiance|trusted/i);
  });

  // ── Le globe ───────────────────────────────────────────
  // C'est ce que ce site sait faire et que personne d'autre n'a : VOIR
  // ou ca se passe. Rien de tout cela n'est dans le DOM — la couche est
  // peinte sur le canvas. On appelle donc la fonction de dessin avec un
  // contexte espion, et on compte ce qu'elle trace.
  test('un rendez-vous pose un marqueur sur le globe', async ({ page }) => {
    await ouvrir(page, '/');
    // La couche se charge en differe, apres l'atlas.
    await expect
      .poll(async () => page.evaluate(() => typeof window.dessinerEvenements),
            { timeout: 20_000 })
      .toBe('function');

    const mesure = await page.evaluate(async () => {
      const pause = (ms) => new Promise((r) => setTimeout(r, ms));
      // Laisser le temps a l'agenda d'arriver (amorcage differe).
      for (let i = 0; i < 60; i++) {
        if (window.__evtVus) break;
        const espion = espionner();
        window.dessinerEvenements(espion.gc, 300, (x, y, z) => ({ x: 400 + x, y: 300 + y, z: 1 }),
                                  (lat, lon, R) => ({ x: 0, y: 0, z: R }), () => 1, 0);
        if (espion.compte.fill > 0) { window.__evtVus = espion.compte.fill; break; }
        await pause(300);
      }

      function espionner() {
        const compte = { fill: 0, stroke: 0 };
        const gc = new Proxy({}, {
          get(_, prop) {
            if (prop === 'fill')   return () => { compte.fill++; };
            if (prop === 'stroke') return () => { compte.stroke++; };
            if (prop === 'save' || prop === 'restore' || prop === 'translate'
             || prop === 'beginPath' || prop === 'moveTo' || prop === 'lineTo'
             || prop === 'closePath' || prop === 'arc') return () => {};
            return undefined;
          },
          set() { return true; },
        });
        return { gc, compte };
      }

      // Cas nominal : le point est sur la face visible.
      const vu = espionner();
      window.dessinerEvenements(vu.gc, 300, (x, y, z) => ({ x: 400, y: 300, z: 1 }),
                                () => ({ x: 0, y: 0, z: 300 }), () => 1, 0);

      // CONTRE-EPREUVE : le meme rendez-vous, de l'autre cote du globe.
      // limbFade rend 0, et plus rien ne doit etre trace — sinon le
      // marqueur flotterait par-dessus la face cachee.
      const cache = espionner();
      window.dessinerEvenements(cache.gc, 300, (x, y, z) => ({ x: 400, y: 300, z: -1 }),
                                () => ({ x: 0, y: 0, z: 300 }), () => 0, 0);

      return { visible: vu.compte.fill, cache: cache.compte.fill };
    });

    expect(mesure.visible, 'aucun marqueur trace pour un rendez-vous a venir')
      .toBeGreaterThan(0);
    expect(mesure.cache, 'un marqueur est trace sur la face cachee du globe')
      .toBe(0);
  });

  // ── Le lien avec l'atlas ───────────────────────────────
  // C'est ce qui empeche la communaute d'etre une ile : on apprend
  // qu'on se retrouve ici sans avoir jamais ouvert le forum.
  test('la fiche d\'un etablissement annonce son prochain rendez-vous', async ({ page }) => {
    await ouvrir(page, '/');
    const trouve = await page.evaluate(async () => {
      const pause = (ms) => new Promise((r) => setTimeout(r, ms));
      const r = await (await fetch('/backend/forum.php?action=agenda&lang=all')).json();
      const evt = (r.events || []).find((e) => e.lounge_id);
      if (!evt) return { err: 'aucun rendez-vous rattache a un etablissement' };

      // Ouvrir le pays qui porte cet etablissement.
      const l = await (await fetch('/backend/data.php?action=lounges_all')).json();
      let pays = null;
      Object.keys(l.lounges || {}).forEach((cid) => {
        if ((l.lounges[cid] || []).some((x) => x.id === evt.lounge_id)) pays = cid;
      });
      if (!pays) return { err: 'etablissement introuvable dans lounges_all' };

      const c = (window.COUNTRIES || []).find((x) => x.id === pays)
             || (window.LOUNGE_COUNTRIES || []).find((x) => x.id === pays);
      if (!c) return { err: 'pays absent du globe : ' + pays };
      // Le bloc « prochain rendez-vous » vit sur la CARTE d'un
      // etablissement, donc dans le panneau des lounges — pas dans
      // l'extrait que la fiche pays en donne.
      openLoungePanel(c);

      for (let i = 0; i < 60; i++) {
        const el = document.getElementById('lc-evt-' + evt.lounge_id);
        if (el && el.textContent.trim()) return { texte: el.textContent };
        await pause(250);
      }
      return { err: 'pas de bloc rendez-vous sur la fiche' };
    });

    expect(trouve.err, trouve.err || '').toBeUndefined();
    expect(trouve.texte).toContain('Degustation de rentree');
  });
});
