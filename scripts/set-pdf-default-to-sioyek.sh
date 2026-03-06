#!/bin/zsh

set -euo pipefail

if ! command -v duti >/dev/null 2>&1; then
  echo "duti not found. Install it with: brew install duti" >&2
  exit 1
fi

sioyek_bundle_id="$(osascript -e 'id of app "Sioyek"' 2>/dev/null || true)"
if [[ -z "$sioyek_bundle_id" ]]; then
  echo "Sioyek not found. Install it with: brew install --cask sioyek" >&2
  exit 1
fi

duti -s "$sioyek_bundle_id" .pdf all
echo "Set as default for .pdf -> $sioyek_bundle_id"
