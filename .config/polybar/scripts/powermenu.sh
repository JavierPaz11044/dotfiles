#!/usr/bin/env bash
# Simple power menu via rofi.

chosen="$(printf 'Lock\nLogout\nReboot\nShutdown\nCancel' | rofi -dmenu -i -p 'Power' -theme-str 'window {width: 20%;}')"
case "$chosen" in
  Lock)
    if [[ -x "${HOME}/.local/bin/lock-screen" ]]; then
      "${HOME}/.local/bin/lock-screen"
    elif command -v loginctl >/dev/null; then
      loginctl lock-session
    fi
    ;;
  Logout) bspc quit ;;
  Reboot) systemctl reboot ;;
  Shutdown) systemctl poweroff ;;
esac
