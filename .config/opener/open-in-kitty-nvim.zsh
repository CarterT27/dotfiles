#!/bin/zsh

PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

KITTY="/Applications/kitty.app/Contents/MacOS/kitty"
NVIM="$(command -v nvim || true)"
KITTY_SOCKET="${KITTY_SOCKET:-unix:/tmp/kitty-main}"

if [[ ! -x "$KITTY" ]]; then
  osascript -e 'display alert "Kitty not found" message "Expected: /Applications/kitty.app. Install Kitty or update KITTY in ~/.config/opener/open-in-kitty-nvim.zsh."'
  exit 1
fi

if [[ -z "$NVIM" ]]; then
  osascript -e 'display alert "nvim not found" message "Neovim is not on PATH for this launcher. If you use Homebrew, it is usually /opt/homebrew/bin/nvim."'
  exit 1
fi

if (( $# == 0 )); then
  exit 0
fi

remote_ok() {
  "$KITTY" @ --to "$KITTY_SOCKET" ls >/dev/null 2>&1
}

launch_cmd='file="$1"; nvim_bin="$2"; cd "${file:h}" || exit 1; "$nvim_bin" "$file"; exec /bin/zsh -i'

open_tab() {
  local file="$1"
  local title="${file:t}"
  "$KITTY" @ --to "$KITTY_SOCKET" launch --type=tab --match "state:focused_os_window" --keep-focus --tab-title "$title" --title "$title" /bin/zsh -ic "$launch_cmd" zsh "$file" "$NVIM"
}

if remote_ok; then
  for f in "$@"; do
    open_tab "$f"
  done
  exit 0
fi

first_file="$1"
first_title="${first_file:t}"
"$KITTY" --listen-on "$KITTY_SOCKET" --directory "$HOME" --title "$first_title" /bin/zsh -ic "$launch_cmd" zsh "$first_file" "$NVIM" >/dev/null 2>&1 &!

for _ in {1..40}; do
  if remote_ok; then
    "$KITTY" @ --to "$KITTY_SOCKET" set-tab-title --match "state:focused_os_window and recent:0" "$first_title" >/dev/null 2>&1 || true
    break
  fi
  sleep 0.1
done

if (( $# > 1 )); then
  shift
  for f in "$@"; do
    if ! open_tab "$f"; then
      fallback_title="${f:t}"
      "$KITTY" -1 --directory "$HOME" --title "$fallback_title" /bin/zsh -ic "$launch_cmd" zsh "$f" "$NVIM" >/dev/null 2>&1 &!
    fi
  done
fi
