#!/usr/bin/env bash
set -euo pipefail

export BUN_INSTALL="$HOME/.bun"
curl -fsSL https://bun.sh/install | bash
export PATH="$BUN_INSTALL/bin:$PATH"

bun install
bunx turbo run build --filter=@acme/api...
cd apps/api
bunx medusa build
