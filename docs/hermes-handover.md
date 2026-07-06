# Deployment Handover — Full Site Redesign (for Hermes)

Deploy the complete dh-electrical.uk redesign: all six pages, rebuilt in the dark
cosmic theme, live in `site/` on `main`.

## What you are deploying

| File | URL | WordPress page ID |
|------|-----|-------------------|
| `site/home.html` | `/` | 6 |
| `site/services.html` | `/services/` | 7 |
| `site/about.html` | `/about/` | 8 |
| `site/contact.html` | `/contact/` | 9 |
| `site/pricing.html` | `/pricing/` | 10 |
| `site/areas.html` | `/areas/` | 11 |

Each file is fully self-contained (inline CSS, no build step). The only external
reference is the logo, already in the WP media library:
`https://dh-electrical.uk/wp-content/uploads/2026/07/dh-electrical-logo.png`.

## Deploy steps

1. **Connect to vps02** (see `docs/site-reference.md` for the jumphost/tailscale chain):
   ```bash
   ssh rham-admin@192.168.120.240
   ssh -i ~/.ssh/oracle_scanner ubuntu@100.113.106.47
   ```

2. **Get the repo onto the box** (clone or pull `main`), then run:
   ```bash
   ./site/deploy.sh
   ```
   The script injects each HTML file into its WordPress page ID via wp-cli
   (as `www-data`, `--path=/var/www/dh-electrical.uk`), flushes the object
   cache, and purges the WP Super Cache disk cache.

   To deploy one page manually instead:
   ```bash
   cd /var/www/dh-electrical.uk
   sudo -u www-data wp post update 7 --post_content="$(cat /path/to/site/services.html)"
   ```

## Post-deploy verification

- [ ] All six URLs return 200 and render the dark theme end-to-end.
- [ ] **No Astra chrome**: if the theme's own white header/footer wraps the
      content, set each page's template to the blank / no-header-footer /
      full-width template (Page Attributes → Template) — same setting the old
      homepage used.
- [ ] **Contact form works**: `/contact/` embeds `[contact-form-7 id="20"
      title="Quick Quote"]`. WordPress expands it at render time; the page CSS
      styles the CF7 fields to match the theme. Submit a test message and
      confirm it arrives at d.hill@dh-electrical.uk (verify SMTP settings before
      treating mail delivery as fully hardened).
- [ ] **Logo renders** in the nav on all pages (media upload from July 2026).
- [ ] **Nav links** between pages work (`/services/`, `/areas/`, `/pricing/`,
      `/about/`, `/contact/` — permalinks must be pretty, they already are).
- [ ] Mobile check: nav collapses (links hide, logo + Get a Quote remain),
      grids stack single-column.
- [ ] Caches: if a page shows stale content, re-purge WP Super Cache
      (`rm -rf /var/www/dh-electrical.uk/wp-content/cache/supercache/*`).

## Known follow-ups (not blockers)

- "Recent work" sections on Home and About use placeholder tiles — swap in
  real photos when available.
- No NICEIC/NAPIT claim is made anywhere (deliberate — add only if registered).
- If CF7 form ID ever changes from 20, update the shortcode in
  `site/contact.html` and redeploy that page.

## Rollback

Use the known-good backup bundle documented in `docs/backup-rollback-plan.md`:

1. Restore the Astra theme backup first.
2. Import the database export only if page content or template assignments need to roll back.
3. Flush caches and permalinks.
4. Verify all six pages.
