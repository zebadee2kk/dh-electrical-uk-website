<?php
/**
 * Template Name: DH Electrical Full HTML
 * Template Post Type: page
 *
 * Serve the static DH Electrical redesign HTML directly, bypassing the
 * Astra theme wrappers and WordPress content filters.
 */

if (!defined('ABSPATH')) {
    exit;
}

$post = get_post();
$slug = $post ? $post->post_name : 'home';

$map = [
    'home' => 'home.html',
    'services' => 'services.html',
    'about' => 'about.html',
    'contact' => 'contact.html',
    'pricing' => 'pricing.html',
    'areas' => 'areas.html',
];

$siteDir = trailingslashit(__DIR__) . 'dh-electrical-pages/';
$file = $siteDir . ($map[$slug] ?? 'home.html');

if (!file_exists($file)) {
    status_header(404);
    nocache_headers();
    echo 'DH Electrical page template could not locate the requested HTML file.';
    exit;
}

header('Content-Type: text/html; charset=' . get_bloginfo('charset'));
header('Cache-Control: no-store, no-cache, must-revalidate, max-age=0');
header('Pragma: no-cache');

$html = file_get_contents($file);
echo do_shortcode($html);
exit;
