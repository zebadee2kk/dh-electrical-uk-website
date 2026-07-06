# DH Electrical Services — dh-electrical.uk

Website for DH Electrical Services — a trusted electrician based in Coulsdon, Surrey.

**Live at:** https://dh-electrical.uk

## Tech Stack

- **CMS:** WordPress 6.8
- **Theme:** Astra 4.13.5 (custom dark theme, green/silver brand)
- **Plugins:** Contact Form 7, Yoast SEO, WP Super Cache, WP Mail SMTP
- **Server:** Nginx 1.18 + PHP 8.3 + MariaDB 10.6
- **SSL:** Let's Encrypt (auto-renew via certbot)
- **DNS:** GoDaddy (A records → 145.241.209.163)

## Repository Contents

| File | Purpose |
|------|---------|
| `site/` | **The full site** — all six page HTML files + deploy script (see `site/README.md`) |
| `docs/site-reference.md` | Infrastructure, access, and brand reference |
| `config/nginx-site.conf` | Production Nginx vhost config |
| `assets/logo.png` | Site logo (DH Electrical Services brand mark) |
| `docs/launch-checklist.md` | What's done and what remains |

## Deployment

The site is hosted on **vps02** (145.241.209.163) alongside theitrevolution.co.uk and other sites. Access is through a jumphost + tailscale chain — see `docs/site-reference.md` for access details.

To deploy all pages into WordPress, run on vps02 from a checkout of this repo:

```bash
./site/deploy.sh
```

See `site/README.md` for the page → WordPress ID mapping and post-deploy checks.