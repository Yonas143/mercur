#!/usr/bin/env bash
set -euo pipefail

export BUN_INSTALL="$HOME/.bun"
curl -fsSL https://bun.sh/install | bash
export PATH="$BUN_INSTALL/bin:$PATH"

bun install
bun run --filter '@mercurjs/storefront^' build
cd apps/storefront
bunx next build