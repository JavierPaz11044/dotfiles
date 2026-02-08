#!/usr/bin/env bash

set -e

echo "🚀 Installing Neovim formatters..."

########################################
# Detect package manager
########################################

if command -v apt >/dev/null 2>&1; then
  PKG_INSTALL="sudo apt install -y"
elif command -v pacman >/dev/null 2>&1; then
  PKG_INSTALL="sudo pacman -S --noconfirm"
elif command -v dnf >/dev/null 2>&1; then
  PKG_INSTALL="sudo dnf install -y"
else
  echo "❌ Unsupported package manager"
  exit 1
fi

########################################
# Prettier (JS/TS/JSON/YAML/Markdown)
########################################

if command -v npm >/dev/null 2>&1; then
  echo "📦 Installing prettier..."
  npm install -g prettier
else
  echo "⚠️ npm not found — skipping prettier"
fi

########################################
# Rust formatter
########################################

if command -v rustup >/dev/null 2>&1; then
  echo "📦 Installing rustfmt..."
  rustup component add rustfmt
else
  echo "⚠️ rustup not found — skipping rustfmt"
fi

########################################
# Lua formatter
########################################

if command -v cargo >/dev/null 2>&1; then
  echo "📦 Installing stylua..."
  cargo install stylua || true
else
  echo "⚠️ cargo not found — skipping stylua"
fi

########################################
# C/C++ and Bash formatters
########################################

echo "📦 Installing clang-format and shfmt..."
$PKG_INSTALL clang-format shfmt

########################################
# Elixir formatter
########################################

if command -v mix >/dev/null 2>&1; then
  echo "✅ Elixir formatter available via 'mix format'"
fi

echo ""
echo "✅ All formatters installed successfully!"
echo "👉 Restart Neovim and save files to auto-format"
