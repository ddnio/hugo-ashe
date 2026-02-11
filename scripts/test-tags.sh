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

if ! grep -q '/tags/hugo/' "$BUILD_DIR/posts/quickstart-hugo-ashe/index.html"; then
  echo "expected tag link in single post page"
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

echo "tag feature checks passed"
