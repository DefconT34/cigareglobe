# Schéma de la base CigarGlobe

La base MySQL (`utf8mb4`) est le cœur du projet, mais son schéma n'était
versionné **nulle part** — il n'existait que sur le serveur de production.
Ce dossier corrige ce point.

## Fichiers

- **`schema.reconstructed.sql`** — schéma **reconstruit à partir du code PHP**
  (toutes les requêtes de `data.php`, `api.php`, `photos.php`, `admin.php`).
  Il liste toutes les tables et colonnes utilisées par l'application. Les
  **types** sont des estimations raisonnables : à considérer comme une
  documentation de travail, **pas** comme la source de vérité tant qu'un vrai
  dump ne l'a pas remplacé.

## ⚠ Obtenir le schéma authentitique (à faire une fois)

Le schéma réel (types exacts, index, clés) doit être extrait du serveur.

### Option A — SSH / terminal o2switch
```bash
mysqldump --no-data --skip-comments \
  -u qffk5199_cigare -p qffk5199_cigare > schema.sql
# puis, pour un jeu de données de démonstration :
mysqldump --no-create-info qffk5199_cigare \
  producer_countries markets lounge_countries > seed.sample.sql
```

### Option B — phpMyAdmin (cPanel)
1. cPanel → phpMyAdmin → base `qffk5199_cigare`
2. Onglet **Exporter** → méthode **Personnalisée**
3. Structure seule (décocher « Données ») → **Exécuter**
4. Enregistrer le `.sql` obtenu dans ce dossier sous `schema.sql`

Committez ensuite `schema.sql` (structure uniquement, jamais de données
personnelles/IP) et gardez `schema.reconstructed.sql` comme historique.
