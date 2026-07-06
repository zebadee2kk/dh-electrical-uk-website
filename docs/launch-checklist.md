# Launch Checklist — DH Electrical Services

## ✅ Completed

- [x] **WordPress provisioned** on vps02 (Nginx vhost, MariaDB, WP install)
- [x] **All 6 pages created** (Home, Services, About, Contact, Pricing, Areas)
- [x] **Homepage built** — matches the provided mockup (hero, features, quick quote, contact info)
- [x] **Logo uploaded** and set as site logo
- [x] **Quick Quote form** via Contact Form 7
- [x] **Astra theme** configured with dark brand colors (green/silver)
- [x] **Essential plugins** installed (Yoast SEO, WP Super Cache, WP Mail SMTP, CF7)
- [x] **Let's Encrypt SSL** acquired and active
- [x] **Production Nginx config** deployed (SSL, caching rules, security headers)
- [x] **Security hardening** (xmlrpc blocked, PHP in uploads blocked, dotfiles hidden)
- [x] **GoDaddy DNS** — A records set for @ and www to 145.241.209.163
- [x] **Site smoke-tested** — all 6 pages return HTTP 200

## ⏳ Remaining / Future

- [ ] **WP Mail SMTP** — Upgrade from PHP mail to proper SMTP (Mailu, SendGrid, or similar) for reliable contact form delivery
- [ ] **WP Super Cache** — Verify cache is working on live HTTPS (may need manual cache prime)
- [ ] **Yoast SEO** — Configure meta titles, descriptions, XML sitemap, social previews
- [ ] **Google Search Console** — Submit sitemap for indexing
- [ ] **Google Business Profile** — Link website to GBP listing
- [ ] **Cloudflare** — Consider moving DNS to Cloudflare for CDN, analytics, and DDoS protection
- [ ] **WPS Hide Login** — Obscure `/wp-admin` URL for additional security
- [ ] **Analytics** — Add Google Analytics or privacy-friendly alternative
- [ ] **Cookie consent** — Add cookie notice if using analytics/tracking
- [ ] **Performance** — Run Lighthouse audit and optimize images