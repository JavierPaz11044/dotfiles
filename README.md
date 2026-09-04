# Dotfiles — bspwm + Polybar (Debian / X11)

Personal desktop configuration for a tiling workflow on X11.

## Included

| Area | Path |
|------|------|
| Window manager | `.config/bspwm/` |
| Keybindings | `.config/sxhkd/` |
| Status bar | `.config/polybar/` |
| Terminal | `.config/kitty/` |
| Compositor | `.config/picom/` |
| Notifications | `.config/dunst/` |
| Launcher | `.config/rofi/` |
| Screenshots | `.local/bin/takeshot*`, `.config/flameshot/` |
| Lock / suspend | `.local/bin/lock-screen`, `suspend-screen` |
| Audio / Bluetooth | `.local/bin/volume`, `bt-audio`, `.config/wireplumber/` |
| Prompt | `.config/starship.toml` |
| Helpers | `.local/bin/{launcher,dashboard,brightness,borders}` |

## Quick install

```bash
git clone https://github.com/JavierPaz11044/Dotfiles.git ~/Dotfiles
cd ~/Dotfiles
./install.sh
```

`install.sh` symlinks configs into `~/.config` and scripts into `~/.local/bin`.

### Optional packages (Debian)

```bash
sudo apt install bspwm sxhkd polybar picom dunst rofi kitty \
  maim flameshot xclip imagemagick feh \
  i3lock i3lock-fancy xss-lock \
  pipewire pipewire-pulse wireplumber libspa-0.2-bluetooth bluez \
  brightnessctl playerctl jq
```

For the fancy lock ring (`i3lock-color`):

```bash
~/.config/bspwm/bin/install-i3lock-color.sh
```

## Useful keybindings

| Shortcut | Action |
|----------|--------|
| `Super + Return` | Terminal (Kitty) |
| `Super + Space` / `Super + R` | App launcher (Rofi) |
| `Super + S` | Region screenshot |
| `Super + Shift + S` | Screenshot + edit (Flameshot) |
| `Super + Alt + L` | Lock screen |
| `Super + Shift + Z` | Lock + suspend |
| `Super + 1` | Workspace 1 (laptop) |
| `Super + 2` … `0` | Workspaces 2–10 (external when docked) |
| `Super + Shift + W` | *(wallpaper if configured)* |

## Dual monitors

- Laptop (`eDP-*`): workspace **1**
- External: workspaces **2–10**

Defined in `.config/bspwm/bspwmrc`.

## Layout

```
Dotfiles/
├── .config/          # XDG configs
├── .local/bin/       # helper scripts
├── install.sh
└── README.md
```
