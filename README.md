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
| `docs/site-reference.md` | Infrastructure, access, and brand reference |
| `config/nginx-site.conf` | Production Nginx vhost config |
| `assets/logo.png` | Site logo (DH Electrical Services brand mark) |
| `docs/launch-checklist.md` | What's done and what remains |

## Deployment

The site is hosted on **vps02** (145.241.209.163) alongside theitrevolution.co.uk and other sites. Access is through a jumphost + tailscale chain.

See `docs/site-reference.md` for full access details.