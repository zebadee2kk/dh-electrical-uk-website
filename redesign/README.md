# DH Electrical Services — Homepage Redesign

Complete frontend rebuild of the dh-electrical.uk homepage.

## Design

- **Theme:** Full dark "cosmic" theme — deep space background with green nebula glows, CSS star field, and a sweeping green light arc across the mid-page
- **Primary green:** `#2BD46E` (hover `#25BA60`, bright `#3BEA80`) — electric green for CTAs, ticks, accents
- **Typography:** System font stack (fast, no webfont requests)
- **Layout:** Top utility bar → sticky dark nav (full logo image) → hero split (headline + CTAs + trust chips left, Quick Quote card right) → trust strip → services grid → areas/how-it-works → pricing → about/recent work → contact → footer
- All sections dark glassmorphism cards (`rgba(255,255,255,.045)` panels with subtle borders); no light sections

## Structure

```
dh-homepage.html             → Full homepage HTML + inline CSS
assets/logo.png              → DH Electrical Services logo
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