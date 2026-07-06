# DH Electrical Services — Backup & Rollback Plan

This document records the safety net used for the current live deployment.

## Backup taken

Created on vps02:

- Database export: `/var/backups/dh-electrical/db-20260706-234040.sql`
- Astra theme backup: `/var/backups/dh-electrical/astra-theme-20260706-234040.tar.gz`
- Site meta / template backup: `/var/backups/dh-electrical/site-meta-20260706-234040.tar.gz`

These files capture the live WordPress database plus the theme files used by the custom page-template bridge.

## What the backup covers

- WordPress page content for all six public pages
- Page template assignments in post meta
- The custom Astra template bridge (`dh-electrical-full-html.php`)
- The copied HTML pages under `wp-content/themes/astra/dh-electrical-pages/`

## Rollback steps

If a change breaks the site, restore in this order:

1. **Restore files**
   - Untar the Astra theme backup back into `wp-content/themes/`
   - Confirm `dh-electrical-full-html.php` and the `dh-electrical-pages/` directory are back in place

2. **Restore the database** if page content or template assignments were changed
   - `sudo -u www-data /usr/local/bin/wp db import /var/backups/dh-electrical/db-20260706-234040.sql --path=/var/www/dh-electrical.uk`

3. **Clear caches**
   - `sudo -u www-data /usr/local/bin/wp cache flush --path=/var/www/dh-electrical.uk`
   - `sudo rm -rf /var/www/dh-electrical.uk/wp-content/cache/supercache/*`

4. **Flush permalinks**
   - `sudo -u www-data /usr/local/bin/wp rewrite flush --path=/var/www/dh-electrical.uk`

5. **Verify**
   - Check `/`, `/services/`, `/areas/`, `/pricing/`, `/about/`, and `/contact/`
   - Confirm the contact form still renders and the email is `d.hill@dh-electrical.uk`

## Notes

- Keep the backup files until the next known-good deployment is committed and verified.
- The site currently relies on the custom Astra template bridge; restoring the theme backup is the fastest way to revert any template regression.
