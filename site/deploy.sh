#!/usr/bin/env bash
# Deploy the DH Electrical Services site pages into WordPress.
#
# Run on vps02 (see docs/site-reference.md for access).
# Usage: ./deploy.sh [wp-root]        (default wp-root: /var/www/dh-electrical.uk)
#
# Each HTML file in this directory is injected as the post_content of its
# WordPress page. Page IDs are from docs/site-reference.md.

set -euo pipefail

WP_PATH="${1:-/var/www/dh-electrical.uk}"
SITE_DIR="$(cd "$(dirname "$0")" && pwd)"

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
  echo "Deploying ${file} -> page ID ${id}"
  sudo -u www-data wp post update "$id" --path="$WP_PATH" --post_content="$(cat "$SITE_DIR/$file")"
done

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
