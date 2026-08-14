#!/usr/bin/env bash
set -euo pipefail

APP="${1:?usage: render-vite.sh <admin-test|vendor>}"
case "$APP" in
  admin-test) FILTER="@acme/admin..." ;;
  vendor)     FILTER="@acme/vendor..." ;;
  *) echo "APP must be admin-test or vendor" >&2; exit 1 ;;
esac

export BUN_INSTALL="$HOME/.bun"
curl -fsSL https://bun.sh/install | bash
export PATH="$BUN_INSTALL/bin:$PATH"

bun install
bunx turbo run build --filter="$FILTER"
cd "apps/$APP"
bunx vite build