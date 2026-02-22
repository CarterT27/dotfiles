#!/bin/zsh

set -euo pipefail

if ! command -v duti >/dev/null 2>&1; then
  echo "duti not found. Install it with: brew install duti" >&2
  exit 1
fi

skim_bundle_id="$(osascript -e 'id of app "Skim"' 2>/dev/null || true)"
if [[ -z "$skim_bundle_id" ]]; then
  echo "Skim not found. Install it with: brew install --cask skim" >&2
  exit 1
fi

duti -s "$skim_bundle_id" .pdf all
echo "Set as default for .pdf -> $skim_bundle_id"
