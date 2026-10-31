#!/usr/bin/env python3
"""Fusionne un JSON {cle: {fr,en,es,de,zh,ar}} dans assets/js/i18n.js.

Usage : python tools/merge_conserver.py <fichier.json>
Une langue absente d'une cle est ignoree (repli sur le francais dans L()).
Cle deja presente : sa ligne est remplacee ; sinon inseree apres pg_marches_d.
Fins de ligne (LF/CRLF) conservees.
"""
import json, re, sys

I18N = __file__.replace("\\", "/").rsplit("/tools/", 1)[0] + "/assets/js/i18n.js"
LANGS = ["fr", "en", "es", "de", "zh", "ar"]
ANCRE = "pg_marches_d"

data = json.load(open(sys.argv[1], encoding="utf-8"))
raw = open(I18N, "rb").read().decode("utf-8")
nl = "\r\n" if "\r\n" in raw else "\n"
lines = raw.split(nl)

def bloc(l):
    deb = next(i for i, s in enumerate(lines) if re.match(r"^  %s: \{" % l, s))
    fin = next(i for i in range(deb + 1, len(lines)) if re.match(r"^  \},?\s*$", lines[i]))
    return deb, fin

n = 0
for l in LANGS:
    for cle, tr in reversed(list(data.items())):  # insertion apres l'ancre : ordre inverse = ordre du JSON
        if not tr.get(l):
            continue
        assert "\n" not in tr[l], f"{cle}/{l} : retour a la ligne interdit"
        ligne = f"    {cle}:{json.dumps(tr[l], ensure_ascii=False)},"
        deb, fin = bloc(l)
        pat = re.compile(r"^    %s:" % re.escape(cle))
        idx = next((i for i in range(deb, fin) if pat.match(lines[i])), None)
        if idx is not None:
            lines[idx] = ligne
        else:
            a = next(i for i in range(deb, fin) if lines[i].startswith(f"    {ANCRE}:"))
            lines.insert(a + 1, ligne)
        n += 1

open(I18N, "wb").write(nl.join(lines).encode("utf-8"))
print(f"{n} entrees ecrites dans i18n.js")
