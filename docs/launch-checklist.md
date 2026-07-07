# Launch Checklist — DH Electrical Services

## ✅ Completed

- [x] **WordPress provisioned** on vps02 (Nginx vhost, MariaDB, WP install)
- [x] **All 6 pages created** (Home, Services, About, Contact, Pricing, Areas)
- [x] **Homepage built** — matches the provided mockup (hero, features, quick quote, contact info)
- [x] **Logo uploaded** and set as site logo
- [x] **Quick Quote form** via Contact Form 7
- [x] **Astra theme** configured with dark brand colors (green/silver)
- [x] **Essential plugins** installed (Yoast SEO, WP Super Cache, WP Mail SMTP, CF7)
- [x] **Login security plugins** installed (Limit Login Attempts Reloaded, Two Factor)
- [x] **Plugin auto-updates** enabled for active plugins
- [x] **Let's Encrypt SSL** acquired and active
- [x] **Production Nginx config** deployed (SSL, caching rules, security headers)
- [x] **Security hardening** (xmlrpc blocked, PHP in uploads blocked, dotfiles hidden)
- [x] **GoDaddy DNS** — A records set for @ and www to 145.241.209.163
- [x] **Site smoke-tested** — all 6 pages return HTTP 200
- [x] **Full-site redesign** — all 6 pages rebuilt in the dark cosmic theme (`site/`), deployable via `site/deploy.sh`
- [x] **Rollback bundle created** — database export plus theme/template backups captured in `/var/backups/dh-electrical/`

## ⏳ Remaining / Future

- [ ] **WP Mail SMTP** — Verify live delivery path end-to-end with a test message and mailbox receipt check
- [ ] **WP Super Cache** — Verify cache is working on live HTTPS (may need manual cache prime)
- [ ] **Yoast SEO** — Configure meta titles, descriptions, XML sitemap, social previews
- [ ] **Google Search Console** — Submit sitemap for indexing
- [ ] **Google Business Profile** — Link website to GBP listing
- [ ] **Cloudflare** — Consider moving DNS to Cloudflare for CDN, analytics, and DDoS protection
- [ ] **WPS Hide Login** — Obscure `/wp-admin` URL for additional security if you want an extra layer beyond 2FA + rate limiting
- [ ] **Analytics** — Add Google Analytics or privacy-friendly alternative
- [ ] **Cookie consent** — Add cookie notice if using analytics/tracking
- [ ] **Performance** — Run Lighthouse audit and optimize images