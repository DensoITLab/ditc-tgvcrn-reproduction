#!/usr/bin/env bash
set -euo pipefail
PATCH_DIR="$(cd "$(dirname "$0")" && pwd)"
git apply --check --whitespace=nowarn "$PATCH_DIR/ditc_tgvcrn.patch"
git apply --whitespace=nowarn "$PATCH_DIR/ditc_tgvcrn.patch"
echo "Patch applied successfully. You can now run: bash run.sh"
