#!/usr/bin/env bash
# pytuna-niri-noctalia: fixes USERPLACEHOLDER paths left in skel-copied
# config files so they point at the real user's $HOME. Runs once.

set -euo pipefail

TARGETS=(
  "$HOME/.config/noctalia/config.toml"
  "$HOME/.config/gtk-3.0/bookmarks"
)

for f in "${TARGETS[@]}"; do
  [[ -f "$f" ]] || continue
  sed -i "s#/home/USERPLACEHOLDER#$HOME#g" "$f"
done

mkdir -p "$HOME/Pictures/Wallpapers" "$HOME/Pictures/Screenshots"

# Self-disable: remove the autostart hook and this script once done
rm -f "$HOME/.config/autostart/pytuna-first-login-fixup.desktop"
rm -f "$0"
