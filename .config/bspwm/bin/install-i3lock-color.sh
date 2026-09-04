#!/usr/bin/env bash
# Build and install i3lock-color to /usr/local/bin/i3lock-color

set -euo pipefail

if [[ "${EUID:-$(id -u)}" -ne 0 ]]; then
  exec sudo -E bash "$0" "$@"
fi

REAL_USER="${SUDO_USER:-${USER}}"
REAL_HOME="$(getent passwd "$REAL_USER" | cut -d: -f6)"
BUILD_DIR="${REAL_HOME}/.cache/i3lock-color-build"
PREFIX=/usr/local

apt-get install -y --no-install-recommends \
  git autoconf automake libtool pkg-config \
  libpam0g-dev libcairo2-dev libfontconfig1-dev libev-dev libjpeg-dev libgif-dev \
  libxinerama-dev libxkbcommon-x11-dev libxrandr-dev \
  libxcb1-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev \
  libxcb-xinerama0-dev libxcb-randr0-dev libxcb-composite0-dev

rm -rf "$BUILD_DIR"
sudo -u "$REAL_USER" git clone --depth 1 https://github.com/Raymo111/i3lock-color.git "$BUILD_DIR"

cd "$BUILD_DIR"
autoreconf -fiv
mkdir -p build
cd build
../configure --prefix="$PREFIX"
make -j"$(nproc)"
make install
mv -f "$PREFIX/bin/i3lock" "$PREFIX/bin/i3lock-color"

echo "Installed: $PREFIX/bin/i3lock-color"
"$PREFIX/bin/i3lock-color" --version 2>&1 | head -1 || true
