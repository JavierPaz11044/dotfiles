#!/usr/bin/env bash
# Symlink Dotfiles into ~/.config and ~/.local/bin

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="${HOME}/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

link_path() {
  local src=$1
  local dest=$2

  mkdir -p "$(dirname "$dest")"

  if [[ -L "$dest" ]]; then
    rm -f "$dest"
  elif [[ -e "$dest" ]]; then
    mkdir -p "$BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/"
    echo "backed up: $dest -> $BACKUP_DIR/"
  fi

  ln -sfn "$src" "$dest"
  echo "linked: $dest"
}

echo "Installing from $ROOT"

# Top-level XDG configs
for name in bspwm sxhkd polybar kitty picom dunst rofi wireplumber flameshot eww; do
  if [[ -d "$ROOT/.config/$name" ]]; then
    link_path "$ROOT/.config/$name" "$HOME/.config/$name"
  fi
done

if [[ -f "$ROOT/.config/starship.toml" ]]; then
  link_path "$ROOT/.config/starship.toml" "$HOME/.config/starship.toml"
fi

# Scripts
mkdir -p "$HOME/.local/bin"
shopt -s nullglob
for script in "$ROOT/.local/bin/"*; do
  [[ -f "$script" ]] || continue
  link_path "$script" "$HOME/.local/bin/$(basename "$script")"
  chmod +x "$HOME/.local/bin/$(basename "$script")"
done

# Ensure PATH hint
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) echo "Tip: add \$HOME/.local/bin to your PATH" ;;
esac

echo
echo "Done."
if [[ -d "$BACKUP_DIR" ]]; then
  echo "Previous files backed up in: $BACKUP_DIR"
fi
echo "Reload: Super+Escape (sxhkd) or restart the session."
