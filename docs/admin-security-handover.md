# DH Electrical Services — Admin Security Handover

Date: 2026-07-07

## Current admin access
- WordPress admin path: `/manage/`
- Old `/wp-login.php`: returns 404
- Login protection: Limit Login Attempts Reloaded + Two Factor

## Active security baseline
- HTTPS enforced
- HSTS enabled
- Permissions-Policy enabled
- X-Content-Type-Options enabled
- X-Frame-Options enabled
- Referrer-Policy enabled
- PHP execution blocked in uploads
- `xmlrpc.php` blocked
- Hidden files denied except `.well-known`

## Active plugin set
- Contact Form 7
- Limit Login Attempts Reloaded
- Two Factor
- WPS Hide Login
- WP Mail SMTP
- WP Super Cache
- Yoast SEO

## Mail configuration
- WP Mail SMTP sender: `d.hill@dh-electrical.uk`
- Mailer: SMTP
- Host: local backend on vps02

## Verification performed
- `https://dh-electrical.uk/wp-login.php` returns 404
- `https://dh-electrical.uk/manage/` serves the login form
- Live response headers include HSTS and Permissions-Policy
- WP-CLI plugin list shows the active security plugins and auto-updates enabled

## Notes
- The site no longer relies on the generic WordPress login URL.
- If the login slug changes, update this document and the site reference together.
