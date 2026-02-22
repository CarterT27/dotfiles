#!/bin/zsh

set -euo pipefail

usage() {
  cat <<'EOF'
Usage: scripts/install-open-in-kitty-nvim-app.sh [--system] [--set-defaults]

Options:
  --system        Install app into /Applications instead of ~/Applications
  --set-defaults  Set .md/.txt/.log default app using duti
  --help          Show this help
EOF
}

app_dir="$HOME/Applications"
set_defaults=0

for arg in "$@"; do
  case "$arg" in
    --system)
      app_dir="/Applications"
      ;;
    --set-defaults)
      set_defaults=1
      ;;
    --help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $arg" >&2
      usage >&2
      exit 1
      ;;
  esac
done

script_dir="${0:A:h}"
repo_root="${script_dir:h}"
source_script="$repo_root/.config/opener/open-in-kitty-nvim.zsh"
source_applescript="$repo_root/.config/opener/Open in Kitty nvim.applescript"

if [[ ! -f "$source_applescript" ]]; then
  echo "AppleScript source not found: $source_applescript" >&2
  exit 1
fi

if [[ ! -x "$source_script" ]]; then
  echo "Launcher script not found or not executable: $source_script" >&2
  exit 1
fi

app_name="Open in Kitty nvim.app"
app_path="$app_dir/$app_name"
bundle_id="com.cartertran.open-in-kitty-nvim"

mkdir -p "$app_dir"
rm -rf "$app_path"
osacompile -o "$app_path" "$source_applescript"

cp "$source_script" "$app_path/Contents/Resources/open-in-kitty-nvim.zsh"
chmod +x "$app_path/Contents/Resources/open-in-kitty-nvim.zsh"

plist="$app_path/Contents/Info.plist"
if /usr/libexec/PlistBuddy -c 'Print :CFBundleIdentifier' "$plist" >/dev/null 2>&1; then
  /usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier $bundle_id" "$plist" >/dev/null
else
  /usr/libexec/PlistBuddy -c "Add :CFBundleIdentifier string $bundle_id" "$plist" >/dev/null
fi

lsregister="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister"
if [[ -x "$lsregister" ]]; then
  "$lsregister" -f "$app_path" >/dev/null 2>&1 || true
fi

echo "Installed app: $app_path"

if (( set_defaults )); then
  if ! command -v duti >/dev/null 2>&1; then
    echo "duti not found. Install it with: brew install duti" >&2
    exit 1
  fi

  duti -s "$bundle_id" .md all
  duti -s "$bundle_id" .txt all
  duti -s "$bundle_id" .log all
  echo "Set as default for .md, .txt, and .log"
fi
