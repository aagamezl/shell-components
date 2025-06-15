#!/bin/bash
# Shell Components - Unified Installer
# This script installs Shell Components, a unified installer for various terminal applications and configurations.
# Author: Álvaro José Agámez Licha - aagamezl
# License:GNU Affero General Public License v3.0

set -e

# --------------------------- VARIABLES ---------------------------
INSTALL_DIR="$HOME/.local/share/shell-components"
# --------------------------- END VARIABLES -----------------------

# --------------------------- COLORS ------------------------------
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
NC="\033[0m" # No Color 
# --------------------------- END COLORS --------------------------

echo -e "${YELLOW}\nBegin installation (or abort with ctrl+c)...${NC}"

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo -e "${YELLOW}Cloning Shell Components...${NC}"

rm -rf "$INSTALL_DIR"
git clone https://github.com/aagamezl/shell-components.git "$INSTALL_DIR" >/dev/null

echo -e "${GREEN}Installation completed.${NC}"
