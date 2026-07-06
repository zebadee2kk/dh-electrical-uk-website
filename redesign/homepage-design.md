# DH Electrical Services — Homepage Redesign

Complete frontend rebuild of the dh-electrical.uk homepage.

## Design

- **Theme:** Modern premium electrician brand with deep green/black surfaces, bright electric green CTAs, soft gradients, and a subtle technical grid background.
- **Primary green:** `#00dc73` with highlight `#39ff9a` for CTAs, focus states, icons, and visual emphasis.
- **Typography:** Archivo for punchy headings and Inter for clear, readable body copy.
- **Layout:** Sticky-feeling rounded navigation, split hero with quote form, proof stats, trust strip, service cards, four-step process, service-area panel, testimonial/FAQ section, and high-contrast final CTA.
- **Responsive approach:** Grid-based desktop composition collapses into single-column mobile sections with full-width actions and simplified navigation.

## Structure

```
redesign/dh-homepage.html    → Full homepage HTML + inline CSS
```

## How to deploy

The HTML is injected into WordPress post ID 6 (Homepage). To update:
```bash
cd /var/www/dh-electrical.uk
sudo -u www-data wp post update 6 --post_content="$(cat /path/to/redesign/dh-homepage.html)"
```

## Tech stack

- WordPress with Astra theme (overridden with custom CSS)
- Contact Form 7 for the Quick Quote form shortcode
- Nginx with WP Super Cache on vps02
