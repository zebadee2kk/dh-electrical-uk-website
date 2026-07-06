# DH Electrical Services — Homepage Redesign

Complete frontend rebuild of the dh-electrical.uk homepage.

## Design

- **Theme:** Premium dark with cosmic nebula background (animated star-drift particles)
- **Primary green:** `#00cc66` — bright electric green for CTAs, accents
- **Typography:** Archivo (headings) + Karla (body) — technical yet approachable
- **Layout:** Hero split (left text + right quote form), features strip, 2-col services grid, area pills, contact strip

## Structure

```
dh-homepage-redesign.html    → Full homepage HTML + inline CSS
```

## How to deploy

The HTML is injected into WordPress post ID 6 (Homepage). To update:
```bash
cd /var/www/dh-electrical.uk
sudo -u www-data wp post update 6 --post_content="$(cat /path/to/new-html.html)"
```

## Tech stack

- WordPress with Astra theme (overridden with custom CSS)
- Contact Form 7 for "Quick Quote" form
- Nginx with WP Super Cache on vps02