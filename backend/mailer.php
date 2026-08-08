<?php
// ════════════════════════════════════════════════════════
// mailer.php — Envoi d'email transactionnel
// ────────────────────────────────────────────────────────
// Point d'entrée unique : send_email(). Le transport est choisi par
// MAIL_DRIVER, sans que le code appelant ait à le savoir :
//
//   log      n'envoie rien, journalise dans backend/cache/mail_outbox.log
//            (mode développement : permet de récupérer les liens de
//            vérification et de réinitialisation)
//   mail     fonction mail() de PHP — repli, délivrabilité médiocre :
//            pas de DKIM, IP mutualisée souvent mal réputée
//   brevo    API HTTP Brevo (ex-Sendinblue)
//   mailgun  API HTTP Mailgun
//   resend   API HTTP Resend
//
// Les trois pilotes HTTP signent les messages en DKIM et gèrent la
// réputation d'envoi : c'est ce qui fait la différence entre « arrive
// en boîte de réception » et « arrive en spam ». Ils supposent que le
// domaine de MAIL_FROM a été vérifié chez le prestataire et que SPF,
// DKIM et DMARC sont publiés — voir docs/emails.md.
//
// Constantes (config.php, alimentées par .env) :
//   MAIL_DRIVER      log | mail | brevo | mailgun | resend
//   MAIL_API_KEY     clé d'API du prestataire (pilotes HTTP)
//   MAIL_FROM        adresse d'expédition, sur le domaine vérifié
//   MAIL_FROM_NAME   nom affiché
//   MAIL_REPLY_TO    adresse de réponse réelle (facultatif)
//   MAILGUN_DOMAIN   domaine d'envoi Mailgun
//   MAILGUN_HOST     api.mailgun.net (défaut) ou api.eu.mailgun.net
//   MAIL_TIMEOUT     délai d'attente HTTP en secondes (défaut 10)
//   MAIL_LOG_ONLY    true → force le pilote « log » (rétrocompatible)
//   MAIL_DEBUG       true → journalise en plus de l'envoi réel
// ════════════════════════════════════════════════════════

// Dernière erreur de transport, pour le diagnostic (jamais renvoyée au client).
$GLOBALS['_mail_last_error'] = '';

function mail_last_error(): string {
    return (string)($GLOBALS['_mail_last_error'] ?? '');
}

/**
 * Pilote effectif. MAIL_LOG_ONLY reste prioritaire (dev et tests).
 * Un pilote HTTP sans clé d'API retombe sur mail() plutôt que d'échouer
 * en silence : mieux vaut un email mal noté qu'un compte inutilisable.
 */
function mail_driver(): string {
    if (defined('MAIL_LOG_ONLY') && MAIL_LOG_ONLY) return 'log';

    $d = defined('MAIL_DRIVER') ? strtolower(trim(MAIL_DRIVER)) : 'mail';
    if (!in_array($d, ['log', 'mail', 'brevo', 'mailgun', 'resend'], true)) return 'mail';

    if (in_array($d, ['brevo', 'mailgun', 'resend'], true)) {
        if (!defined('MAIL_API_KEY') || MAIL_API_KEY === '') {
            _mail_log('-', 'configuration', "MAIL_DRIVER=$d sans MAIL_API_KEY — repli sur mail()", 'CONFIG');
            return 'mail';
        }
        if (!function_exists('curl_init')) {
            _mail_log('-', 'configuration', "MAIL_DRIVER=$d mais cURL absent — repli sur mail()", 'CONFIG');
            return 'mail';
        }
    }
    return $d;
}

function _mail_log(string $to, string $subject, string $body, string $status): void {
    $dir = __DIR__ . '/cache';
    if (!is_dir($dir)) @mkdir($dir, 0755, true);
    $line = '[' . date('Y-m-d H:i:s') . "] [$status] To: $to | $subject\n"
          . $body . "\n" . str_repeat('─', 60) . "\n";
    @file_put_contents($dir . '/mail_outbox.log', $line, FILE_APPEND);
}

function _mail_from(): array {
    $addr = defined('MAIL_FROM') && MAIL_FROM !== ''
          ? MAIL_FROM
          : ('noreply@' . ($_SERVER['HTTP_HOST'] ?? 'cigarodyssey.com'));
    $name = defined('MAIL_FROM_NAME') && MAIL_FROM_NAME !== '' ? MAIL_FROM_NAME : 'CigarOdyssey';
    return [$addr, $name];
}

/**
 * Version texte du message. Un email HTML sans alternative texte est
 * pénalisé par les filtres anti-spam ; les liens sont explicités pour
 * rester utilisables.
 */
function mail_text_from_html(string $html): string {
    $t = preg_replace('#<(script|style)\b[^>]*>.*?</\1>#is', '', $html);
    $t = preg_replace('#<a\b[^>]*href=(["\'])(.*?)\1[^>]*>(.*?)</a>#is', '$3 : $2', $t);
    $t = preg_replace('#<(br|/p|/div|/h[1-6]|/tr)\s*/?>#i', "\n", $t);
    $t = html_entity_decode(strip_tags($t), ENT_QUOTES | ENT_HTML5, 'UTF-8');
    $t = preg_replace('/[ \t]+/', ' ', $t);
    $t = preg_replace('/\n\s*\n\s*\n+/', "\n\n", $t);
    return trim($t);
}

/**
 * Requête HTTP POST JSON ou formulaire. Retourne [status, corps].
 * Un status 0 signale une erreur réseau (le corps porte le message).
 */
function _mail_http(string $url, array $headers, $payload): array {
    $timeout = defined('MAIL_TIMEOUT') ? max(2, (int)MAIL_TIMEOUT) : 10;
    $ch = curl_init($url);
    curl_setopt_array($ch, [
        CURLOPT_POST           => true,
        CURLOPT_POSTFIELDS     => is_array($payload) ? http_build_query($payload) : $payload,
        CURLOPT_HTTPHEADER     => $headers,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_TIMEOUT        => $timeout,
        CURLOPT_CONNECTTIMEOUT => min(5, $timeout),
        CURLOPT_SSL_VERIFYPEER => true,
        CURLOPT_SSL_VERIFYHOST => 2,
    ]);
    $body   = curl_exec($ch);
    $status = (int)curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $err    = curl_error($ch);
    curl_close($ch);
    if ($body === false) return [0, $err ?: 'erreur cURL'];
    return [$status, (string)$body];
}

/** Une réponse transitoire mérite une seconde tentative. */
function _mail_is_transient(int $status): bool {
    return $status === 0 || $status === 429 || $status >= 500;
}

// ── Pilotes ───────────────────────────────────────────────

function _mail_via_brevo(string $to, string $subject, string $html, string $text): array {
    [$fromAddr, $fromName] = _mail_from();
    $payload = [
        'sender'      => ['email' => $fromAddr, 'name' => $fromName],
        'to'          => [['email' => $to]],
        'subject'     => $subject,
        'htmlContent' => $html,
        'textContent' => $text,
    ];
    if (defined('MAIL_REPLY_TO') && MAIL_REPLY_TO !== '') {
        $payload['replyTo'] = ['email' => MAIL_REPLY_TO];
    }
    return _mail_http('https://api.brevo.com/v3/smtp/email',
        ['Content-Type: application/json', 'Accept: application/json', 'api-key: ' . MAIL_API_KEY],
        json_encode($payload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
}

function _mail_via_mailgun(string $to, string $subject, string $html, string $text): array {
    [$fromAddr, $fromName] = _mail_from();
    $domain = defined('MAILGUN_DOMAIN') && MAILGUN_DOMAIN !== ''
            ? MAILGUN_DOMAIN
            : substr(strrchr($fromAddr, '@') ?: '@', 1);
    $host   = defined('MAILGUN_HOST') && MAILGUN_HOST !== '' ? MAILGUN_HOST : 'api.mailgun.net';
    $fields = [
        'from'    => sprintf('%s <%s>', $fromName, $fromAddr),
        'to'      => $to,
        'subject' => $subject,
        'html'    => $html,
        'text'    => $text,
    ];
    if (defined('MAIL_REPLY_TO') && MAIL_REPLY_TO !== '') $fields['h:Reply-To'] = MAIL_REPLY_TO;
    return _mail_http('https://' . $host . '/v3/' . rawurlencode($domain) . '/messages',
        ['Authorization: Basic ' . base64_encode('api:' . MAIL_API_KEY)],
        $fields);
}

function _mail_via_resend(string $to, string $subject, string $html, string $text): array {
    [$fromAddr, $fromName] = _mail_from();
    $payload = [
        'from'    => sprintf('%s <%s>', $fromName, $fromAddr),
        'to'      => [$to],
        'subject' => $subject,
        'html'    => $html,
        'text'    => $text,
    ];
    if (defined('MAIL_REPLY_TO') && MAIL_REPLY_TO !== '') $payload['reply_to'] = MAIL_REPLY_TO;
    return _mail_http('https://api.resend.com/emails',
        ['Content-Type: application/json', 'Authorization: Bearer ' . MAIL_API_KEY],
        json_encode($payload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
}

/**
 * Repli mail(). Message multipart texte + HTML, en-têtes Date et
 * Message-ID explicites, et enveloppe d'expéditeur (-f) alignée sur
 * MAIL_FROM pour que le Return-Path corresponde à l'enregistrement SPF.
 */
function _mail_via_php(string $to, string $subject, string $html, string $text): array {
    [$fromAddr] = _mail_from();
    [$headers, $body] = mail_build_mime($subject, $html, $text);
    $ok = @mail($to, _mail_encode_header($subject), $body, $headers, '-f' . $fromAddr);
    return $ok ? [200, 'ok'] : [0, 'mail() a refusé le message'];
}

/**
 * Construit les en-têtes et le corps multipart/alternative du repli
 * mail(). Isolé du transport pour rester vérifiable par les tests.
 * Retourne [en-têtes, corps].
 */
function mail_build_mime(string $subject, string $html, string $text): array {
    [$fromAddr, $fromName] = _mail_from();
    $domain   = substr(strrchr($fromAddr, '@') ?: '@localhost', 1);
    $boundary = 'cg' . bin2hex(random_bytes(12));

    $headers  = "MIME-Version: 1.0\r\n";
    $headers .= "Content-Type: multipart/alternative; boundary=\"$boundary\"\r\n";
    $headers .= 'From: ' . sprintf('%s <%s>', _mail_encode_header($fromName), $fromAddr) . "\r\n";
    if (defined('MAIL_REPLY_TO') && MAIL_REPLY_TO !== '') $headers .= 'Reply-To: ' . MAIL_REPLY_TO . "\r\n";
    $headers .= 'Date: ' . date('r') . "\r\n";
    $headers .= 'Message-ID: <' . bin2hex(random_bytes(16)) . '@' . $domain . ">\r\n";
    $headers .= "X-Mailer: CigarOdyssey\r\n";
    $headers .= "Auto-Submitted: auto-generated\r\n";

    $body  = "--$boundary\r\n"
           . "Content-Type: text/plain; charset=UTF-8\r\n"
           . "Content-Transfer-Encoding: base64\r\n\r\n"
           . chunk_split(base64_encode($text)) . "\r\n"
           . "--$boundary\r\n"
           . "Content-Type: text/html; charset=UTF-8\r\n"
           . "Content-Transfer-Encoding: base64\r\n\r\n"
           . chunk_split(base64_encode($html)) . "\r\n"
           . "--$boundary--\r\n";

    return [$headers, $body];
}

/** Encodage RFC 2047 des en-têtes non ASCII (sujet, nom d'expéditeur). */
function _mail_encode_header(string $s): string {
    return preg_match('/[\x80-\xFF]/', $s)
        ? '=?UTF-8?B?' . base64_encode($s) . '?='
        : $s;
}

// ── Point d'entrée ────────────────────────────────────────

/**
 * Envoie un email HTML. Retourne true si le message a été accepté par
 * le transport. N'émet jamais d'exception et ne divulgue rien au
 * client : les échecs partent dans backend/cache/mail_outbox.log.
 */
function send_email(string $to, string $subject, string $html): bool {
    $GLOBALS['_mail_last_error'] = '';
    $driver = mail_driver();
    $text   = mail_text_from_html($html);

    if ($driver === 'log') {
        _mail_log($to, $subject, $html, 'LOG_ONLY');
        return true;
    }

    $send = function () use ($driver, $to, $subject, $html, $text): array {
        switch ($driver) {
            case 'brevo':   return _mail_via_brevo($to, $subject, $html, $text);
            case 'mailgun': return _mail_via_mailgun($to, $subject, $html, $text);
            case 'resend':  return _mail_via_resend($to, $subject, $html, $text);
            default:        return _mail_via_php($to, $subject, $html, $text);
        }
    };

    [$status, $resp] = $send();
    // Une panne passagère (réseau, 429, 5xx) mérite une seconde tentative.
    if (_mail_is_transient($status) && $driver !== 'mail') {
        usleep(400000);
        [$status, $resp] = $send();
    }

    $ok = $status >= 200 && $status < 300;
    if (!$ok) {
        $GLOBALS['_mail_last_error'] = $driver . ' — HTTP ' . $status . ' : ' . substr($resp, 0, 300);
        _mail_log($to, $subject, mail_last_error(), 'FAILED');
    } elseif (defined('MAIL_DEBUG') && MAIL_DEBUG) {
        _mail_log($to, $subject, $html, 'SENT[' . $driver . ']');
    }
    return $ok;
}

/**
 * Gabarit HTML sobre aux couleurs du site.
 */
function email_template(string $title, string $intro, string $btnLabel, string $btnUrl, string $footer = ''): string {
    $safe = fn($s) => htmlspecialchars($s, ENT_QUOTES, 'UTF-8');
    return '<div style="font-family:Arial,Helvetica,sans-serif;max-width:520px;margin:0 auto;background:#100C07;color:#E0C88A;padding:32px 28px;border-radius:12px">'
         . '<div style="text-align:center;margin-bottom:24px">'
         . '<div style="font-family:Georgia,serif;font-size:20px;color:#C9A227;letter-spacing:.15em">CIGAR ODYSSEY</div>'
         . '<div style="font-size:10px;color:#6B5030;letter-spacing:.25em;margin-top:4px">THE WORLD\'S PREMIUM CIGAR ATLAS</div>'
         . '</div>'
         . '<h1 style="font-size:18px;color:#E8C040;font-weight:normal">' . $safe($title) . '</h1>'
         . '<p style="font-size:14px;line-height:1.6;color:#C9B27A">' . $safe($intro) . '</p>'
         . '<div style="text-align:center;margin:28px 0">'
         . '<a href="' . $safe($btnUrl) . '" style="display:inline-block;background:#C9A227;color:#0A0603;'
         . 'text-decoration:none;padding:13px 28px;border-radius:6px;font-weight:bold;font-size:13px;letter-spacing:.05em">'
         . $safe($btnLabel) . '</a></div>'
         . '<p style="font-size:11px;color:#6B5030;line-height:1.5;word-break:break-all">'
         . 'Si le bouton ne fonctionne pas, copiez ce lien :<br>' . $safe($btnUrl) . '</p>'
         . ($footer ? '<p style="font-size:11px;color:#6B5030;margin-top:20px">' . $safe($footer) . '</p>' : '')
         . '</div>';
}

// ════════════════════════════════════════════════════════
// TRADUCTION DES EMAILS
// ────────────────────────────────────────────────────────
// EXCEPTION ASSUMÉE À LA RÈGLE DU LOT F2. `config.php` la pose ainsi :
// « Le serveur ne traduit pas. Le front lit le code et cherche la clé. »
// Elle tient parce qu'un message d'API est toujours affiché par un front
// qui, lui, connaît la langue du visiteur.
//
// Un email n'a pas de front. Personne d'autre que PHP ne peut le
// traduire. D'où ce dictionnaire — volontairement minuscule, et qui doit
// le rester : tout ce qui peut être traduit côté client doit l'être là.
//
// La langue vient de `users.lang` (migration 014). À défaut, français.
// ════════════════════════════════════════════════════════

/** Textes des emails, par clé puis par langue. */
function mail_i18n(): array {
    return [
        'appr_sujet' => [
            'fr' => 'Votre établissement est en ligne',
            'en' => 'Your venue is now live',
            'es' => 'Su establecimiento ya está publicado',
            'de' => 'Ihr Etablissement ist online',
            'zh' => '您提交的场所已上线',
            'ar' => 'تم نشر المكان الذي اقترحته',
        ],
        'appr_titre_nom' => [
            'fr' => 'Merci, {nom} !',
            'en' => 'Thank you, {nom}!',
            'es' => '¡Gracias, {nom}!',
            'de' => 'Danke, {nom}!',
            'zh' => '{nom}，谢谢您！',
            'ar' => 'شكراً لك يا {nom}!',
        ],
        'appr_titre' => [
            'fr' => 'Merci pour votre contribution !',
            'en' => 'Thank you for your contribution!',
            'es' => '¡Gracias por su contribución!',
            'de' => 'Danke für Ihren Beitrag!',
            'zh' => '感谢您的贡献！',
            'ar' => 'شكراً على مساهمتك!',
        ],
        'appr_corps' => [
            'fr' => '« {lieu} » ({ville}, {pays}) vient d\'être publié sur CigarOdyssey. '
                  . 'Votre signalement a été vérifié puis ajouté à l\'atlas : il est désormais '
                  . 'visible par tous les visiteurs.',
            'en' => '“{lieu}” ({ville}, {pays}) has just been published on CigarOdyssey. '
                  . 'Your submission was reviewed and added to the atlas: it is now visible '
                  . 'to every visitor.',
            'es' => '«{lieu}» ({ville}, {pays}) acaba de publicarse en CigarOdyssey. '
                  . 'Su propuesta ha sido verificada y añadida al atlas: ya es visible '
                  . 'para todos los visitantes.',
            'de' => '„{lieu}“ ({ville}, {pays}) wurde soeben auf CigarOdyssey veröffentlicht. '
                  . 'Ihr Hinweis wurde geprüft und in den Atlas aufgenommen — er ist nun für '
                  . 'alle Besucher sichtbar.',
            'zh' => '「{lieu}」（{ville}，{pays}）已发布至 CigarOdyssey。'
                  . '您提交的信息经核实后已收入图册，现在所有访客都能看到。',
            'ar' => '«{lieu}» ({ville}، {pays}) نُشر للتوّ على CigarOdyssey. '
                  . 'تمّ التحقّق من بلاغك وإضافته إلى الأطلس، وهو الآن ظاهر لجميع الزوّار.',
        ],
        'appr_bouton' => [
            'fr' => 'Voir la fiche',   'en' => 'View the venue',
            'es' => 'Ver la ficha',    'de' => 'Zum Eintrag',
            'zh' => '查看条目',         'ar' => 'عرض البطاقة',
        ],
        'appr_pied' => [
            'fr' => 'Vous recevez cet email parce que vous avez proposé un établissement sur CigarOdyssey.',
            'en' => 'You are receiving this email because you submitted a venue to CigarOdyssey.',
            'es' => 'Recibe este correo porque propuso un establecimiento en CigarOdyssey.',
            'de' => 'Sie erhalten diese E-Mail, weil Sie CigarOdyssey ein Etablissement vorgeschlagen haben.',
            'zh' => '您收到此邮件，是因为您曾向 CigarOdyssey 提交过一个场所。',
            'ar' => 'وصلتك هذه الرسالة لأنك اقترحت مكاناً على CigarOdyssey.',
        ],
    ];
}

/**
 * Texte d'email traduit, avec substitution des variables.
 *
 *   mail_t('appr_bouton', 'de')                       → « Zum Eintrag »
 *   mail_t('appr_titre_nom', 'es', ['nom' => 'Ana'])  → « ¡Gracias, Ana! »
 *
 * Repli sur le français si la langue est inconnue, et sur la clé si le
 * texte manque — comme t() côté front, pour que l'absence se voie.
 */
function mail_t(string $cle, ?string $lang = null, array $vars = []): string {
    $d = mail_i18n()[$cle] ?? null;
    if (!$d) return $cle;
    $l = in_array((string)$lang, ['fr','en','es','de','zh','ar'], true) ? (string)$lang : 'fr';
    $s = $d[$l] ?? $d['fr'] ?? $cle;
    foreach ($vars as $k => $v) $s = str_replace('{' . $k . '}', (string)$v, $s);
    return $s;
}
