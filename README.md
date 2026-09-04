# Dotfiles — bspwm + Polybar (Debian / X11)

Personal desktop configuration for a tiling workflow on X11.

## Included

| Area | Path |
|------|------|
| Window manager | `.config/bspwm/` |
| Keybindings | `.config/sxhkd/` |
| Status bar | `.config/polybar/` |
| Dashboard popup | `.config/eww/`, `.local/bin/dashboard` |
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

## Packages to install (Debian)

### Core desktop

```bash
sudo apt install \
  bspwm sxhkd polybar picom dunst rofi kitty \
  feh xorg xdg-user-dirs \
  network-manager-gnome \
  policykit-1
```

### Screenshots / clipboard / images

```bash
sudo apt install \
  maim flameshot xclip xdotool \
  imagemagick
```

### Lock screen

```bash
sudo apt install i3lock i3lock-fancy xss-lock
```

For the colored ring + clock (`i3lock-color`), after cloning:

```bash
~/.config/bspwm/bin/install-i3lock-color.sh
# needs build deps (script installs them), including libgif-dev
```

### Audio / Bluetooth

```bash
sudo apt install \
  pipewire pipewire-pulse wireplumber \
  libspa-0.2-bluetooth bluez blueman \
  pulseaudio-utils \
  playerctl
```

### Brightness / extras

```bash
sudo apt install brightnessctl jq libnotify-bin
```

### Prompt (optional)

```bash
# starship: https://starship.rs  (or cargo / official install script)
curl -sS https://starship.rs/install.sh | sh
```

### Fonts (recommended)

- JetBrainsMono Nerd Font (polybar / lock clock)
- Comic Mono (rofi launcher)

Install Nerd Fonts into `~/.local/share/fonts` and run `fc-cache -fv`.

### EWW dashboard (optional)

`Super + D` opens the eww dashboard. You need an `eww` binary at `~/.local/bin/eww` (build from [elkowar/eww](https://github.com/elkowar/eww) or copy your existing binary). Config is under `.config/eww/`.

### Polkit agent (KDE, if installed)

bspwmrc starts `polkit-kde-authentication-agent-1` when present. On pure Debian without Plasma:

```bash
sudo apt install policykit-1-gnome
# then edit bspwmrc to start /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1
```

## Useful keybindings

| Shortcut | Action |
|----------|--------|
| `Super + Return` | Terminal (Kitty) |
| `Super + Space` / `Super + R` | App launcher (Rofi) |
| `Super + D` | EWW dashboard |
| `Super + S` | Region screenshot |
| `Super + Shift + S` | Screenshot + edit (Flameshot) |
| `Super + Alt + L` / `Super + Shift + X` | Lock screen |
| `Super + Shift + Z` / `Super + Alt + Shift + L` | Lock + suspend |
| `Super + 1` | Workspace 1 (laptop) |
| `Super + 2` … `0` | Workspaces 2–10 (external when docked) |
| `Super + Escape` | Reload sxhkd |

## Dual monitors

- Laptop (`eDP-*`): workspace **1**
- External: workspaces **2–10**

Defined in `.config/bspwm/bspwmrc`. Wallpapers: random image from `~/.wallpaper` via `feh` on login.

## Layout

```
Dotfiles/
├── .config/          # XDG configs
├── .local/bin/       # helper scripts
├── install.sh
└── README.md
```

## Not included (on purpose)

- Browser / IDE profiles (Brave, Chrome, Cursor, VS Code)
- Secrets, SSH keys, tokens
- Compiled binaries (`eww`, `kitty` AppImage) — install or copy separately
- Hyprland leftovers (this setup is bspwm / X11)
