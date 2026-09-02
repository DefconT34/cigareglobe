<?php
// ════════════════════════════════════════════════════════
// legal.php — Mentions légales, confidentialité, conditions
// ────────────────────────────────────────────────────────
// POURQUOI UNE SEULE PAGE
// Trois documents, trois ancres, un seul fichier : ils se lisent
// ensemble, se modifient ensemble, et un lecteur qui cherche « comment
// supprimer mes données » ne sait pas d'avance dans lequel des trois
// c'est écrit.
//
// POURQUOI EN FRANÇAIS SEULEMENT
// Le site parle six langues, cette page une seule — et c'est délibéré.
// Un texte juridique traduit par la même main que la prose de l'atlas
// engage sans que personne n'ait relu ce qu'il engage. Le droit
// applicable est français ; le texte fait foi en français. Traduire
// viendra avec une relecture juridique, pas avant.
//
// LE RÉGIME RETENU : ÉDITEUR PARTICULIER
// L'article 6-III-2 de la LCEN dispense la personne physique qui édite
// à titre NON PROFESSIONNEL d'afficher son nom et son adresse, à
// condition de les avoir communiqués à son hébergeur. C'est le régime
// des sites personnels, et c'est celui déclaré ici.
//
// Il ne couvre que la LCEN. Le RGPD, lui, ne connaît pas cette
// dispense : le responsable du traitement doit rester joignable et
// répondre des droits d'accès et d'effacement. D'où la section qui le
// dit explicitement plutôt que de laisser croire que le masquage
// s'étend aux données personnelles.
//
// Les coordonnées de l'hébergeur sont relevées sur son propre site, et
// non écrites de mémoire.
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/backend/config.php';

$maj = '31 août 2026';
$h   = fn(string $s) => htmlspecialchars($s, ENT_QUOTES, 'UTF-8');
?><!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Mentions légales, confidentialité et conditions — CigarOdyssey</title>
<meta name="description" content="Mentions légales, politique de confidentialité et conditions d'utilisation de CigarOdyssey, l'atlas mondial du cigare premium.">
<!-- Ces pages ne sont pas du contenu éditorial : on les sert, on ne
     cherche pas à les classer. -->
<meta name="robots" content="noindex,follow">
<link rel="stylesheet" href="assets/css/themes.css">
<style>
  body { background: var(--bg, #0A0603); color: var(--text, #E0C88A);
         font-family: 'Lato', -apple-system, Segoe UI, sans-serif;
         margin: 0; line-height: 1.7; }
  .lg-wrap { max-width: 46em; margin: 0 auto; padding: 40px 22px 80px; }
  .lg-ey { font-family: 'Cinzel', Georgia, serif; font-size: 15px;
           color: #C9A227; letter-spacing: .22em; text-align: center; }
  .lg-back { display: inline-block; margin-top: 18px; font-size: 13px;
             color: #C9A227; text-decoration: none; }
  .lg-back:hover { text-decoration: underline; }
  h1 { font-family: 'Cinzel', Georgia, serif; font-size: 24px; font-weight: 400;
       color: #E8C040; margin: 28px 0 4px; }
  h2 { font-family: 'Cinzel', Georgia, serif; font-size: 18px; font-weight: 400;
       color: #E8C040; margin: 46px 0 10px; padding-top: 22px;
       border-top: 1px solid rgba(201,162,39,.22); }
  h3 { font-size: 14px; color: #C9A227; margin: 26px 0 6px;
       letter-spacing: .04em; text-transform: uppercase; }
  p, li { font-size: 14.5px; color: #C9B27A; }
  a { color: #C9A227; }
  code { font-size: 13px; color: #E0C88A; background: rgba(201,162,39,.10);
         padding: 1px 5px; border-radius: 4px; }
  .lg-maj { font-size: 12px; color: #6B5030; }
  .lg-sommaire { margin: 24px 0 0; padding: 0; list-style: none; }
  .lg-sommaire li { margin: 5px 0; }
  .lg-todo { border: 1px solid rgba(207,94,94,.45); background: rgba(207,94,94,.08);
             border-radius: 8px; padding: 12px 16px; margin: 14px 0; }
  .lg-todo strong { color: #CF5E5E; letter-spacing: .06em; font-size: 12px; }
  .lg-todo p { margin: 6px 0 0; font-size: 13.5px; }
  table { width: 100%; border-collapse: collapse; margin: 14px 0; font-size: 13.5px; }
  th, td { text-align: left; padding: 8px 10px; vertical-align: top;
           border-bottom: 1px solid rgba(201,162,39,.14); }
  th { color: #C9A227; font-weight: 400; font-size: 12px;
       letter-spacing: .06em; text-transform: uppercase; }
  td { color: #C9B27A; }
  .lg-sante { margin-top: 44px; padding-top: 18px; font-size: 12px; color: #6B5030;
              border-top: 1px solid rgba(201,162,39,.22); }
  @media (max-width: 560px) { table, thead, tbody, th, td, tr { display: block; }
    th { display: none; } td { border: none; padding: 3px 0; }
    tr { border-bottom: 1px solid rgba(201,162,39,.14); padding: 10px 0; } }
</style>
</head>
<body>
<div class="lg-wrap">

  <div class="lg-ey">CIGAR ODYSSEY</div>
  <h1>Mentions légales, confidentialité et conditions</h1>
  <p class="lg-maj">Dernière mise à jour : <?= $h($maj) ?></p>

  <ul class="lg-sommaire">
    <li><a href="#mentions">1. Mentions légales</a></li>
    <li><a href="#donnees">2. Politique de confidentialité</a></li>
    <li><a href="#conditions">3. Conditions d'utilisation</a></li>
  </ul>

  <!-- ══════════════════════════════════════════════════ -->
  <h2 id="mentions">1. Mentions légales</h2>

  <h3>Éditeur</h3>
  <p>Ce site est édité à titre <strong>non professionnel, par une
  personne physique</strong>. Il ne vend rien et ne tire aucun revenu de
  son contenu.</p>
  <p>À ce titre, et conformément à l'article 6-III-2 de la loi n°2004-575
  du 21 juin 2004 pour la confiance dans l'économie numérique, l'éditeur
  a choisi de ne pas rendre publiques son identité et son adresse. Il les
  a <strong>communiquées à son hébergeur</strong>, qui les conserve et
  peut les transmettre sur réquisition de l'autorité judiciaire.</p>
  <p>Cette réserve ne vaut pas anonymat : l'éditeur reste identifiable et
  responsable de ce qui est publié ici.</p>
  <p>
    Contact : <?= ADMIN_EMAIL !== '' && ADMIN_EMAIL !== 'vous@example.com'
                 ? '<a href="mailto:' . $h(ADMIN_EMAIL) . '">' . $h(ADMIN_EMAIL) . '</a>'
                 // Ce repli ne porte PAS le marqueur « À COMPLÉTER » : le
                 // contrôle d'avant-vol lit le fichier SOURCE, pas la page
                 // rendue. Le marqueur y resterait donc à jamais et
                 // bloquerait le décollage même une fois l'adresse
                 // renseignée. ADMIN_EMAIL a déjà son propre contrôle.
                 : '<code>adresse non renseignée (ADMIN_EMAIL)</code>' ?><br>
    Toute demande — droit d'accès ou d'effacement, signalement d'un
    contenu, réclamation — se traite à cette adresse.
  </p>

  <h3>Responsable du traitement des données</h3>
  <p>La même personne physique, joignable à l'adresse ci-dessus. Le
  masquage prévu par la loi de 2004 vaut à l'égard du public ; il ne
  dispense d'aucune des obligations du règlement général sur la
  protection des données, détaillées au chapitre 2.</p>

  <h3>Hébergeur</h3>
  <p>
    <strong>o2switch</strong><br>
    Chemin des Pardiaux, 63000 Clermont-Ferrand, France<br>
    Téléphone : 04 44 44 60 40<br>
    SIRET 510 909 807 00032
  </p>

  <div class="lg-todo">
    <strong>DEUX POINTS À CONFIRMER</strong>
    <p><strong>1. L'identité déposée chez l'hébergeur.</strong> Le régime
    ci-dessus ne tient que si l'éditeur a bien communiqué ses nom, prénom
    et adresse à o2switch — ce sont les informations du compte client.
    Sans elles, la dispense d'affichage tombe.</p>
    <p><strong>2. L'hébergeur.</strong> Les coordonnées ci-dessus sont
    celles d'o2switch, relevées sur son propre site. À corriger si le
    site est hébergé ailleurs.</p>
  </div>

  <h3>Propriété intellectuelle</h3>
  <p>Les textes de l'atlas — fiches pays, articles de marque, notices de
  feuilles, lexique — sont rédigés pour ce site. Les données
  cartographiques proviennent d'<a href="https://www.openstreetmap.org/copyright"
  rel="noopener">OpenStreetMap</a> et de ses contributeurs, sous licence
  ODbL. La bibliothèque de cartographie Leaflet est distribuée sous
  licence BSD-2-Clause. Les noms de marques et les visuels de bagues
  appartiennent à leurs détenteurs respectifs et sont cités à titre
  documentaire.</p>

  <!-- ══════════════════════════════════════════════════ -->
  <h2 id="donnees">2. Politique de confidentialité</h2>

  <p>Cette section n'est pas un modèle recopié : elle décrit ce que le
  site enregistre réellement, table par table. Si le code change, elle
  doit changer avec lui.</p>

  <h3>Ce que le site enregistre</h3>
  <table>
    <thead><tr><th>Donnée</th><th>Quand</th><th>Pourquoi</th><th>Durée</th></tr></thead>
    <tbody>
    <tr><td>Adresse électronique, nom d'affichage, mot de passe (haché)</td>
        <td>À l'inscription</td>
        <td>Tenir un compte, vérifier l'adresse, permettre la connexion</td>
        <td>Jusqu'à suppression du compte</td></tr>
    <tr><td>Langue de correspondance, avatar, présentation, préférence de notification</td>
        <td>Au profil</td>
        <td>Écrire dans votre langue, vous présenter aux autres membres</td>
        <td>Jusqu'à suppression du compte</td></tr>
    <tr><td>Avis, notes, favoris, listes</td>
        <td>Quand vous les écrivez</td>
        <td>Publier votre avis, calculer la note d'un établissement</td>
        <td>Supprimés avec le compte</td></tr>
    <tr><td>Messages, sujets, réactions, inscriptions aux rendez-vous</td>
        <td>Quand vous les publiez</td>
        <td>Faire vivre l'espace communautaire</td>
        <td>Les messages restent, signés « Membre supprimé » — voir plus bas</td></tr>
    <tr><td>Établissements proposés, avec l'adresse électronique et l'adresse IP du dépôt</td>
        <td>À la contribution</td>
        <td>Vous prévenir de la publication, limiter les envois en masse</td>
        <td>La fiche reste ; vos coordonnées sont effacées avec le compte</td></tr>
    <tr><td>Remarques envoyées par la boîte à suggestions, avec l'adresse
            électronique <strong>si vous en donnez une</strong>, la page où vous
            étiez et votre langue</td>
        <td>Quand vous écrivez par le bouton 💬</td>
        <td>Corriger ce que vous signalez, et vous répondre le cas échéant</td>
        <td>Effacées une fois traitées</td></tr>
    <tr><td>Jetons de vérification et de réinitialisation</td>
        <td>À l'inscription, à l'oubli du mot de passe</td>
        <td>Prouver que l'adresse est la vôtre</td>
        <td>Expirent, puis sont effacés</td></tr>
    <tr><td>Adresse IP des tentatives de connexion</td>
        <td>À chaque connexion, inscription ou demande d'envoi</td>
        <td>Empêcher les essais de mots de passe en série</td>
        <td>Sans valeur au-delà de l'heure ; purgées</td></tr>
    <tr><td>Décisions de modération, avec le nom de qui les a prises</td>
        <td>Quand un contenu est approuvé, rejeté, retiré ou masqué</td>
        <td>Pouvoir relire ce qui a été décidé, et par qui</td>
        <td>Conservées — voir la réserve ci-dessous</td></tr>
    </tbody>
  </table>

  <h3>Ce que le site n'enregistre pas</h3>
  <p>Aucun traceur publicitaire, aucune mesure d'audience tierce, aucun
  script chargé depuis un autre domaine. La politique de sécurité de
  contenu du site n'autorise d'ailleurs plus aucune origine extérieure
  pour les scripts. Les seules requêtes qui sortent servent à afficher
  les tuiles de la carte (OpenStreetMap) et les polices de caractères
  (Google Fonts).</p>
  <p>Votre navigateur conserve localement votre confirmation d'âge, votre
  choix de thème et votre langue. Ces informations ne quittent pas votre
  appareil : ce ne sont pas des cookies de suivi, et c'est pourquoi le
  site ne vous demande pas de consentement pour les déposer.</p>

  <h3>Vos droits</h3>
  <p>Vous pouvez consulter et corriger vos informations depuis
  <strong>Mon profil</strong>. Vous pouvez <strong>supprimer votre
  compte</strong> depuis le même écran : le bouton se trouve en bas, il
  demande votre mot de passe, et l'effacement est immédiat et définitif.</p>
  <p>Ce qui disparaît alors : le compte, l'adresse électronique, les
  avis, les notes, les listes, les jetons, les signalements — ainsi que
  l'adresse électronique et l'adresse IP attachées aux établissements
  que vous aviez proposés.</p>
  <p>Ce qui reste : vos messages du forum, signés « Membre supprimé ».
  Les effacer rendrait incompréhensibles les réponses que d'autres leur
  ont faites. Restent aussi les établissements que vous avez proposés et
  qui ont été publiés : une fiche d'atlas n'est pas une donnée
  personnelle.</p>
  <p><strong>Une réserve, dite franchement :</strong> si vous avez été
  modérateur ou administrateur, les décisions prises à ce titre restent
  au journal sous votre nom, même après la suppression de votre compte.
  On ne confie pas un pouvoir sur le contenu d'autrui si l'on peut
  effacer ensuite la trace de son exercice. Tout le reste de votre
  activité est anonymisé.</p>
  <p>Pour toute demande d'accès, de rectification ou d'opposition, ainsi
  que pour une réclamation, écrivez à l'adresse de contact ci-dessus.
  Vous pouvez également saisir la CNIL.</p>

  <div class="lg-todo">
    <strong>À VÉRIFIER AVANT LA MISE EN LIGNE</strong>
    <p>Le portage des données (article 20 du RGPD) n'est pas encore
    outillé : il n'existe pas d'export automatique. Une demande se
    traite donc à la main. À décider : outiller, ou l'assumer par écrit.</p>
  </div>

  <!-- ══════════════════════════════════════════════════ -->
  <h2 id="conditions">3. Conditions d'utilisation</h2>

  <h3>Accès réservé aux majeurs</h3>
  <p>Ce site traite du cigare, un produit du tabac. Son accès est
  réservé aux personnes ayant l'âge légal pour consommer du tabac dans
  leur pays — 18 ans en France. Le site ne vend rien, ne propose rien à
  la vente et n'a pas de vocation promotionnelle : il documente une
  culture, ses terroirs et ses maisons.</p>

  <h3>Comptes</h3>
  <p>L'inscription demande une adresse électronique valide, qu'il faut
  confirmer avant de pouvoir écrire. Un compte est personnel. Vous
  répondez de ce qui est publié depuis le vôtre.</p>

  <h3>Ce que vous publiez</h3>
  <p>Avis, messages, photographies et propositions d'établissements
  restent les vôtres ; en les publiant, vous autorisez le site à les
  afficher. N'y déposez que ce dont vous avez le droit de disposer —
  une photographie que vous n'avez pas prise n'est pas la vôtre.</p>
  <p>Sont retirés sans préavis : la publicité, les propos injurieux ou
  haineux, les données fausses, et tout ce qui incite à la consommation
  de tabac plutôt que de l'éclairer.</p>

  <h3>Modération</h3>
  <p>Trois signalements distincts masquent un message en attendant qu'un
  modérateur tranche — deux s'il porte une image. Un modérateur peut
  retirer un message, un avis ou une photographie, et rétablir ce qui a
  été masqué à tort. Chaque décision est inscrite au journal, sous le
  nom de qui l'a prise.</p>

  <h3>Exactitude du contenu</h3>
  <p>Les fiches sont rédigées à partir de sources publiques et
  vérifiées, mais un établissement ferme, une gamme change, un chiffre
  vieillit. Vérifiez auprès de l'établissement avant de vous déplacer.</p>

  <h3>Droit applicable</h3>
  <p>Ces conditions sont régies par le droit français.</p>

  <p class="lg-sante">Le tabac nuit gravement à votre santé et à celle
  de votre entourage. Fumer provoque le cancer.</p>

  <a class="lg-back" href="/">← Retour à l'atlas</a>
</div>
</body>
</html>
