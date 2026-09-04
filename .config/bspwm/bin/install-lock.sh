#!/usr/bin/env bash
# Install screen lock tools for bspwm (i3lock + xss-lock).

set -euo pipefail

if [[ "${EUID:-$(id -u)}" -ne 0 ]]; then
  exec sudo -E bash "$0" "$@"
fi

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends i3lock i3lock-fancy xss-lock imagemagick scrot

echo "Done. For the circle indicator design, also run:"
echo "  ~/.config/bspwm/bin/install-i3lock-color.sh"
