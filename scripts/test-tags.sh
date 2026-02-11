#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="$(mktemp -d)"
trap 'rm -rf "$BUILD_DIR"' EXIT

hugo --source "$ROOT_DIR/exampleSite" --themesDir "$ROOT_DIR/.." --theme hugo-ashe --destination "$BUILD_DIR" >/dev/null

if ! grep -q '"tags":' "$BUILD_DIR/index.json"; then
  echo "expected tags field in index.json"
  exit 1
fi

if ! grep -q '/tags/quickstart/' "$BUILD_DIR/posts/quickstart-hugo-ashe/index.html"; then
  echo "expected tag link in single post page metadata"
  exit 1
fi

if ! grep -q '/tags/hugo/' "$BUILD_DIR/index.html"; then
  echo "expected tag link in post list page"
  exit 1
fi

if [[ ! -f "$BUILD_DIR/tags/hugo/index.html" ]]; then
  echo "expected generated tag taxonomy term page"
  exit 1
fi

if ! grep -q 'term-count' "$BUILD_DIR/tags/index.html"; then
  echo "expected tag count on tags index page"
  exit 1
fi

if grep -q 'post-card' "$BUILD_DIR/tags/index.html"; then
  echo "expected tags index to render terms, not post cards"
  exit 1
fi

if grep -q '/tags/theme/' "$BUILD_DIR/index.html"; then
  echo "expected overlapping tag '#Theme' to be hidden on post list"
  exit 1
fi

if grep -q '/tags/guide/' "$BUILD_DIR/index.html"; then
  echo "expected overlapping tag '#Guide' to be hidden on post list"
  exit 1
fi

HUGO_TAG_COUNT="$( (grep -o '/tags/hugo/' "$BUILD_DIR/index.html" || true) | wc -l | tr -d ' ')"
if [[ "$HUGO_TAG_COUNT" != "1" ]]; then
  echo "expected exactly one visible '#Hugo' tag on post list, got $HUGO_TAG_COUNT"
  exit 1
fi

QUICKSTART_META="$(sed -n '/<h4 class=page-info>/,/<\/h4>/p' "$BUILD_DIR/posts/quickstart-hugo-ashe/index.html")"
if echo "$QUICKSTART_META" | grep -q '/tags/hugo/'; then
  echo "expected overlapping '#Hugo' to be hidden in quickstart post metadata"
  exit 1
fi

TOOLKIT_META="$(sed -n '/<h4 class=page-info>/,/<\/h4>/p' "$BUILD_DIR/posts/hugo-ashe-theme-toolkit/index.html")"
if echo "$TOOLKIT_META" | grep -q '/tags/theme/'; then
  echo "expected overlapping '#Theme' to be hidden in toolkit post metadata"
  exit 1
fi

if echo "$TOOLKIT_META" | grep -q '/tags/guide/'; then
  echo "expected overlapping '#Guide' to be hidden in toolkit post metadata"
  exit 1
fi

echo "tag feature checks passed"
