#!/usr/bin/env bash
# Launch eww-style pills: shell | workspaces | system | ip | right

killall -q polybar 2>/dev/null || true
# Wait up to 3s for old bars to exit
for _ in $(seq 1 15); do
  pgrep -u "$UID" -x polybar >/dev/null || break
  sleep 0.2
done
killall -9 polybar 2>/dev/null || true
sleep 0.2

CONFIG="${HOME}/.config/polybar/config.ini"
PRIMARY="$(xrandr --query | awk '/ connected primary/{print $1; exit}')"
if [[ -z "$PRIMARY" ]]; then
  PRIMARY="$(xrandr --query | awk '/ connected/{print $1; exit}')"
fi

mapfile -t MONITORS < <(polybar --list-monitors 2>/dev/null | cut -d: -f1)
if [[ ${#MONITORS[@]} -eq 0 ]]; then
  MONITORS=("$PRIMARY")
fi

for mon in "${MONITORS[@]}"; do
  MONITOR="$mon" polybar -c "$CONFIG" -r shell &
  MONITOR="$mon" polybar -c "$CONFIG" -r wspills &
  MONITOR="$mon" polybar -c "$CONFIG" -r system &
  MONITOR="$mon" polybar -c "$CONFIG" -r ip &
  if [[ "$mon" == "$PRIMARY" ]]; then
    MONITOR="$mon" polybar -c "$CONFIG" -r right &
  else
    MONITOR="$mon" polybar -c "$CONFIG" -r right-notray &
  fi
done

disown -a 2>/dev/null || true
echo "Polybar pills launched on: ${MONITORS[*]}"
