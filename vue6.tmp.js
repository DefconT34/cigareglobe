const { chromium } = require('@playwright/test');
(async () => {
  const dir = process.argv[2];
  const nav = await chromium.launch();
  const page = await nav.newPage({ viewport: { width: 1000, height: 1000 }, deviceScaleFactor: 2 });
  const err = [];
  page.on('pageerror', (e) => err.push('EXCEPTION ' + e.message));
  await page.addInitScript(() => localStorage.setItem('cg_age18', '1'));
  await page.goto('http://127.0.0.1:8098/', { waitUntil: 'domcontentloaded' });
  await page.waitForTimeout(4000);
  await page.locator('#forumBtn').click();
  await page.waitForTimeout(3000);
  await page.evaluate(() => window.ouvrirForum('rencontres', null));
  await page.waitForTimeout(2500);
  console.log(JSON.stringify({
    boite: await page.locator('.fo-box').count(),
    quand: await page.locator('.fo-quand').count(),
    corps: (await page.locator('.fo-body').innerHTML().catch(() => 'X')).slice(0, 300),
    err,
  }, null, 1));
  await nav.close();
})();
