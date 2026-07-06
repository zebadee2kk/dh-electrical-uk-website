# dh-electrical.uk — Site Reference

## Infrastructure

| Aspect | Detail |
|--------|--------|
| **Domain** | dh-electrical.uk |
| **Platform** | WordPress 6.8 on vps02 (Ubuntu, Nginx, PHP 8.3, MariaDB 10.6) |
| **Theme** | Astra 4.13.5 (dark theme, green/silver brand colors) |
| **Plugins** | Contact Form 7, Yoast SEO, WP Super Cache, WP Mail SMTP |
| **Hosting** | vps02 (145.241.209.163, OCI) — same VPS as theitrevolution.co.uk |
| **DNS** | GoDaddy nameservers (ns35/ns36.domaincontrol.com), A records to vps02 IP |
| **SSL** | Let's Encrypt via certbot, auto-renews (expires 2026-10-04) |
| **CDN** | None (no Cloudflare proxying yet) |

## Access

| Resource | Details |
|----------|---------|
| **SSH** | Via jumphost: `rham-admin@192.168.120.240` → `ubuntu@100.113.106.47` (tailscale) |
| **SSH Key** | `oracle_scanner` on jumphost |
| **WP Root** | `/var/www/dh-electrical.uk/` |
| **WP-CLI** | `/usr/local/bin/wp` |
| **Nginx vhost** | `/etc/nginx/sites-available/dh-electrical.uk` |
| **DB** | `wp_dh_electrical_uk` on localhost (MariaDB) |
| **DB User** | `wp_dh_electrical` |
| **Admin** | WP admin credentials stored in `/root/dh-electrical-db-pass.txt` on vps02 |
| **Logs** | `/var/log/nginx/dh-electrical.uk.*.log` |

## Brand Details

- **Name:** DH Electrical Services
- **Tagline:** Trusted Electrician in Surrey
- **Colors:** Dark background (#0a0a0a), green accent (#00aa55), silver metallic
- **Phone:** 07824 512 971
- **Email:** d.hill@dh-electrical.uk
- **Areas:** Coulsdon, Surrey and surrounding areas

## Services Listed

1. Domestic Rewires
2. Consumer Unit Upgrades
3. EV Charger Installation
4. EICR Reports (Landlord safety)
5. Lighting & Upgrades
6. Fault Finding & Repairs
7. Test & Inspection
8. Emergency Call-Out

## Pages

| Page | Slug | Status |
|------|------|--------|
| Home | `/` | Live (ID: 6) |
| Services | `/services/` | Live (ID: 7) |
| About | `/about/` | Live (ID: 8) |
| Contact | `/contact/` | Live (ID: 9) |
| Pricing | `/pricing/` | Live (ID: 10) |
| Areas | `/areas/` | Live (ID: 11) |

## Automation / Content OS

- No n8n pipeline configured yet
- WP Mail SMTP on PHP mail — should be upgraded to SMTP for reliable form delivery
- Quick Quote form via Contact Form 7 (ID: 20) — sends to d.hill@dh-electrical.uk

## Current Rendering Approach

- The live site is rendered through a custom Astra page template: `dh-electrical-full-html.php`
- The template serves the HTML files from `wp-content/themes/astra/dh-electrical-pages/`
- `do_shortcode()` is applied at render time so Contact Form 7 shortcodes expand correctly
- The deploy script updates the page template assignment and refreshes both WP cache and WP Super Cache

## Backup / Rollback Bundle

Latest known-good bundle on vps02:

- DB export: `/var/backups/dh-electrical/db-20260706-234040.sql`
- Theme backup: `/var/backups/dh-electrical/astra-theme-20260706-234040.tar.gz`
- Site/meta backup: `/var/backups/dh-electrical/site-meta-20260706-234040.tar.gz`

Rollback sequence:

1. Restore theme files from the tarball.
2. Import the database export if content needs to be reverted.
3. Flush WP cache and clear `/wp-content/cache/supercache/`.
4. Run `wp rewrite flush` and verify all six public pages.

## Security Hardening

- [x] SSL/HTTPS enforced (301 redirect from HTTP)
- [x] Security headers (X-Content-Type-Options, X-Frame-Options, Referrer-Policy)
- [x] PHP execution blocked in uploads
- [x] xmlrpc.php blocked
- [x] Hidden files denied (except .well-known)
- [ ] Cloudflare proxying (not set — DNS at GoDaddy)
- [ ] WPS Hide Login (not installed yet)

## Deployment Command

```bash
# Connect via jumphost
ssh rham-admin@192.168.120.240
# Then to vps02 via tailscale
ssh -i ~/.ssh/oracle_scanner ubuntu@100.113.106.47 -J tailscale
```

## Related Sites (same VPS)

- theitrevolution.co.uk
- hamnet.theitrevolution.co.uk
- castellum.theitrevolution.co.uk
- on-maintenance.theitrevolution.co.uk
- vps02.webhost365.co.uk