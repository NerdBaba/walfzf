#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="$HOME/.local/bin"
INSTALL_PATH="$INSTALL_DIR/walfzf"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()  { echo -e "${GREEN}[install]${NC} $*"; }
warn()  { echo -e "${YELLOW}[warn]${NC} $*"; }
error() { echo -e "${RED}[error]${NC} $*" >&2; exit 1; }

# Check source exists
if [[ ! -f "$SCRIPT_DIR/walfzf" ]]; then
    error "walfzf not found in $SCRIPT_DIR"
fi

# Check dependencies
for cmd in bash curl jq fzf sed grep; do
    if ! command -v "$cmd" &>/dev/null; then
        error "Required dependency not found: $cmd"
    fi
done

# Optional dependencies
for cmd in chafa kitty imgcat; do
    if ! command -v "$cmd" &>/dev/null; then
        warn "Optional dependency not found: $cmd (preview may fall back to text mode)"
    fi
done

# Create install dir
mkdir -p "$INSTALL_DIR"

# Install
cp "$SCRIPT_DIR/walfzf" "$INSTALL_PATH"
chmod +x "$INSTALL_PATH"

info "Installed walfzf to $INSTALL_PATH"

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    warn "$INSTALL_DIR is not in your PATH"
    echo ""
    echo "Add one of the following to your shell config (~/.zshrc or ~/.bashrc):"
    echo ""
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo ""
    echo "Then run: source ~/.zshrc"
else
    info "$INSTALL_DIR is already in PATH"
fi

# Verify
if "$INSTALL_PATH" help &>/dev/null; then
    info "Installation verified — run 'walfzf help' to get started"
else
    warn "Installation completed but 'walfzf help' failed — check your shell"
fi
