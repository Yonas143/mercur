#!/usr/bin/env bash
set -euo pipefail

APP="${1:?usage: render-vite.sh <admin-test|vendor>}"
if [[ "$APP" != "admin-test" && "$APP" != "vendor" ]]; then
  echo "APP must be admin-test or vendor" >&2
  exit 1
fi

export BUN_INSTALL="$HOME/.bun"
curl -fsSL https://bun.sh/install | bash
export PATH="$BUN_INSTALL/bin:$PATH"

bun install
bun run --filter "@acme/${APP}..." build
cd "apps/${APP}"
bunx vite build