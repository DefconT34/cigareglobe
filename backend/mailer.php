<?php
// ════════════════════════════════════════════════════════
// mailer.php — Abstraction d'envoi d'email
// ────────────────────────────────────────────────────────
// Point d'entrée unique : send_email(). Implémentation mail()
// aujourd'hui, swappable vers un service transactionnel (Brevo,
// Mailgun…) plus tard SANS toucher au code appelant.
//
// Constantes optionnelles (config.php) :
//   MAIL_FROM       'noreply@cigareglobe.com'
//   MAIL_FROM_NAME  'CigarGlobe'
//   MAIL_LOG_ONLY   true  → n'envoie rien, écrit dans le log (DEV)
//   MAIL_DEBUG      true  → journalise en plus de l'envoi réel
// ════════════════════════════════════════════════════════

function _mail_log(string $to, string $subject, string $body, string $status): void {
    $dir = __DIR__ . '/cache';
    if (!is_dir($dir)) @mkdir($dir, 0755, true);
    $line = '[' . date('Y-m-d H:i:s') . "] [$status] To: $to | $subject\n"
          . $body . "\n" . str_repeat('─', 60) . "\n";
    @file_put_contents($dir . '/mail_outbox.log', $line, FILE_APPEND);
}

/**
 * Envoie un email HTML. Retourne true si accepté pour envoi.
 */
function send_email(string $to, string $subject, string $html): bool {
    $fromAddr = defined('MAIL_FROM')      ? MAIL_FROM      : ('noreply@' . ($_SERVER['HTTP_HOST'] ?? 'cigareglobe.com'));
    $fromName = defined('MAIL_FROM_NAME') ? MAIL_FROM_NAME : 'CigarGlobe';

    $headers  = 'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-Type: text/html; charset=utf-8' . "\r\n";
    $headers .= 'From: ' . sprintf('%s <%s>', $fromName, $fromAddr) . "\r\n";
    $headers .= 'Reply-To: ' . $fromAddr . "\r\n";

    // Mode DEV : ne rien envoyer, journaliser (permet de récupérer les liens)
    if (defined('MAIL_LOG_ONLY') && MAIL_LOG_ONLY) {
        _mail_log($to, $subject, $html, 'LOG_ONLY');
        return true;
    }

    $ok = @mail($to, '=?UTF-8?B?' . base64_encode($subject) . '?=', $html, $headers);
    if (!$ok || (defined('MAIL_DEBUG') && MAIL_DEBUG)) {
        _mail_log($to, $subject, $html, $ok ? 'SENT' : 'FAILED');
    }
    return (bool)$ok;
}

/**
 * Gabarit HTML sobre aux couleurs du site.
 */
function email_template(string $title, string $intro, string $btnLabel, string $btnUrl, string $footer = ''): string {
    $safe = fn($s) => htmlspecialchars($s, ENT_QUOTES, 'UTF-8');
    return '<div style="font-family:Arial,Helvetica,sans-serif;max-width:520px;margin:0 auto;background:#100C07;color:#E0C88A;padding:32px 28px;border-radius:12px">'
         . '<div style="text-align:center;margin-bottom:24px">'
         . '<div style="font-family:Georgia,serif;font-size:20px;color:#C9A227;letter-spacing:.15em">CIGAR GLOBE</div>'
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
