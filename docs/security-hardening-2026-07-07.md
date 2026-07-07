# DH Electrical Services — Security Hardening Log

Date: 2026-07-07
Scope: live WordPress site on vps02 plus repo docs/config alignment.

## What changed

### WordPress plugins
Installed and activated:
- Limit Login Attempts Reloaded
- Two Factor
- WPS Hide Login

Removed inactive plugins:
- Akismet
- Elementor
- Hello Dolly

### Hidden login path
- WPS Hide Login slug: `/manage/`
- Old `/wp-login.php` now returns 404

Enabled auto-updates for the active plugin set:
- Contact Form 7
- Limit Login Attempts Reloaded
- Two Factor
- WP Mail SMTP
- WP Super Cache
- Yoast SEO

### Nginx headers
Added the following response headers in `config/nginx-site.conf`:
- `Strict-Transport-Security: max-age=31536000; includeSubDomains`
- `Permissions-Policy: geolocation=(), microphone=(), camera=(), payment=()`

Existing headers retained:
- `X-Content-Type-Options: nosniff`
- `X-Frame-Options: SAMEORIGIN`
- `Referrer-Policy: strict-origin-when-cross-origin`

### Mail settings check
Confirmed via WP-CLI that WP Mail SMTP is already configured with:
- sender email: `d.hill@dh-electrical.uk`
- mailer: SMTP
- host: local backend on vps02

## Verification

### Plugin verification
WP-CLI plugin listing after the changes showed:
- Contact Form 7 — active — auto-updates on
- Limit Login Attempts Reloaded — active — auto-updates on
- Two Factor — active — auto-updates on
- WP Mail SMTP — active — auto-updates on
- WP Super Cache — active — auto-updates on
- Yoast SEO — active — auto-updates on

### Header verification
Before this change, the site already sent:
- `X-Content-Type-Options`
- `X-Frame-Options`
- `Referrer-Policy`

The repo config now adds HSTS and Permissions-Policy on top of those.

### HTML cache behavior
HTML page responses now send `Cache-Control: no-cache, no-store, must-revalidate` so mobile browsers revalidate and avoid sticky stale markup.

## Notes

- WPS Hide Login is active and the login path is now `/manage/`; the site also has login rate limiting + 2FA in place.
- No content or page rendering changes were made in this pass.
- The repo docs were updated to reflect the real live plugin set and the new hardening baseline.
