# DH Electrical Services — Site Pages

The complete dh-electrical.uk frontend: six standalone HTML pages sharing one dark
"cosmic" theme. Each file is self-contained (inline CSS, no build step, no external
assets except the logo already uploaded to WordPress). The live site uses a custom
Astra page template (`dh-electrical-full-html.php`) to serve these files directly.

## Pages

| File | URL | WordPress page ID |
|------|-----|-------------------|
| `home.html` | `/` | 6 |
| `services.html` | `/services/` | 7 |
| `about.html` | `/about/` | 8 |
| `contact.html` | `/contact/` | 9 |
| `pricing.html` | `/pricing/` | 10 |
| `areas.html` | `/areas/` | 11 |

## Deploying

On vps02 (access via jumphost — see `docs/site-reference.md`), from a checkout of
this repo:

```bash
./site/deploy.sh
```

That copies the HTML pages and the custom template into Astra, assigns the template
to the six pages, and flushes the caches. To deploy a single page manually:

```bash
cd /var/www/dh-electrical.uk
sudo -u www-data wp post update 7 --post_content="$(cat /path/to/site/services.html)"
```

### Post-deploy checks

- All six URLs return 200 and render the dark theme with no Astra chrome.
- The contact page form works: `contact.html` embeds the Contact Form 7
  shortcode `[contact-form-7 id="20" title="Quick Quote"]`, which WordPress
  expands at render time via the custom template. The page CSS styles the CF7
  fields to match the theme. If the form ID ever changes, update the shortcode
  in `contact.html`.
- Logo renders — all pages reference the WordPress media upload
  `https://dh-electrical.uk/wp-content/uploads/2026/07/dh-electrical-logo.png`
  (source of truth: `assets/logo.png` in this repo).

## Design

- **Theme:** Full dark "cosmic" theme — deep space background with green nebula
  glows, CSS star field, and a sweeping green light arc
- **Primary green:** `#2BD46E` (hover `#25BA60`, bright `#3BEA80`)
- **Typography:** System font stack (fast, no webfont requests)
- **Chrome (identical on every page):** top utility bar → sticky dark nav with
  the full logo image and active-page highlight → page content → green CTA band
  (interior pages) → footer with page links
- All content sections are dark glassmorphism cards
  (`rgba(255,255,255,.045)` panels, subtle borders, green accents)

## Editing

The pages share their chrome and CSS by construction. When changing anything
shared (nav, footer, colors, CSS), apply the same change to **all six files** —
they must stay in lockstep. Page-specific content lives inside each file's
`<main>` element.

## Rollback safety

- Known-good backup bundle is documented in `docs/backup-rollback-plan.md`
- If anything breaks, restore the Astra theme backup first — it includes the
  page-template bridge and copied HTML pages
