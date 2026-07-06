#!/usr/bin/env bash
# Deploy the DH Electrical Services site pages into WordPress.
#
# Run on vps02 (see docs/site-reference.md for access).
# Usage: ./deploy.sh [wp-root]        (default wp-root: /var/www/dh-electrical.uk)
#
# This deploy copies the static HTML pages and a custom WordPress template into
# the active Astra theme, then assigns that template to the DH Electrical pages.
# The template serves the HTML files directly so WordPress/Astra chrome is bypassed.

set -euo pipefail

WP_PATH="${1:-/var/www/dh-electrical.uk}"
SITE_DIR="$(cd "$(dirname "$0")" && pwd)"
THEME_DIR="$WP_PATH/wp-content/themes/astra"
ASSET_DIR="$THEME_DIR/dh-electrical-pages"
TEMPLATE_FILE="$THEME_DIR/dh-electrical-full-html.php"

sudo mkdir -p "$ASSET_DIR"
sudo cp "$SITE_DIR"/{home.html,services.html,about.html,contact.html,pricing.html,areas.html} "$ASSET_DIR/"
sudo cp "$SITE_DIR/dh-electrical-full-html.php" "$TEMPLATE_FILE"
sudo chmod 644 "$TEMPLATE_FILE"
sudo chmod 644 "$ASSET_DIR"/*.html

# Page IDs are from docs/site-reference.md.
declare -A PAGES=(
  [home.html]=6
  [services.html]=7
  [about.html]=8
  [contact.html]=9
  [pricing.html]=10
  [areas.html]=11
)

for file in home.html services.html about.html contact.html pricing.html areas.html; do
  id="${PAGES[$file]}"
  echo "Assigning template for ${file} -> page ID ${id}"
  sudo -u www-data wp post meta update "$id" _wp_page_template "dh-electrical-full-html.php" --path="$WP_PATH" >/dev/null
  echo "Updating cached page content for ${file} -> page ID ${id}"
  sudo -u www-data wp post update "$id" --path="$WP_PATH" --post_content="$(cat "$SITE_DIR/$file")" >/dev/null
 done

# Ensure the front page + child pages resolve the new template.
sudo -u www-data wp rewrite flush --hard --path="$WP_PATH" >/dev/null

echo "Flushing caches..."
sudo -u www-data wp cache flush --path="$WP_PATH" || true
# WP Super Cache: purge the disk cache so changes go live immediately
sudo -u www-data rm -rf "$WP_PATH/wp-content/cache/supercache/"* 2>/dev/null || true

echo "Done. Verify:"
echo "  https://dh-electrical.uk/           (Home)"
echo "  https://dh-electrical.uk/services/"
echo "  https://dh-electrical.uk/areas/"
echo "  https://dh-electrical.uk/pricing/"
echo "  https://dh-electrical.uk/about/"
echo "  https://dh-electrical.uk/contact/"
