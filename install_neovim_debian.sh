#!/bin/bash

# Exit on error
set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting Neovim nightly installation with all dependencies...${NC}"

# Update system
echo -e "${YELLOW}Updating system...${NC}"
sudo DEBIAN_FRONTEND=noninteractive apt update
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# Install basic dependencies
echo -e "${YELLOW}Installing basic dependencies...${NC}"
sudo DEBIAN_FRONTEND=noninteractive apt install -y git curl wget unzip xclip ripgrep fd-find make gcc g++ nodejs npm python3 python3-pip

# Install development dependencies
echo -e "${YELLOW}Installing development tools...${NC}"
sudo DEBIAN_FRONTEND=noninteractive apt install -y build-essential cmake gettext

# Install Lua and LuaRocks (for LSP)
echo -e "${YELLOW}Installing Lua and LuaRocks...${NC}"
sudo DEBIAN_FRONTEND=noninteractive apt install -y lua5.3 liblua5.3-dev luarocks

# Create symbolic link for fd
echo -e "${YELLOW}Creating fd symlink...${NC}"
if ! command -v fd &> /dev/null; then
    sudo ln -s $(which fdfind) /usr/local/bin/fd
fi

# Install the latest Neovim nightly version using AppImage
echo -e "${YELLOW}Installing Neovim nightly...${NC}"

# Download the nightly AppImage
wget -O nvim-linux-x86_64.appimage https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage

# Check if FUSE is available
if ./nvim-linux-x86_64.appimage --version > /dev/null 2>&1; then
    echo -e "${GREEN}FUSE is available, using AppImage directly${NC}"
    sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
else
    echo -e "${YELLOW}FUSE not available, extracting AppImage...${NC}"
    ./nvim-linux-x86_64.appimage --appimage-extract
    # Create a bin directory if it doesn't exist
    sudo mkdir -p /usr/local/bin
    sudo rm -rf /opt/nvim
    sudo mkdir -p /opt/nvim
    sudo mv squashfs-root/* /opt/nvim/
    sudo ln -sf /opt/nvim/usr/bin/nvim /usr/local/bin/nvim
    rm -rf squashfs-root
    rm nvim-linux-x86_64.appimage
fi

# Install Python support for Neovim
echo -e "${YELLOW}Installing Python support for Neovim...${NC}"
python3 -m pip install --user --upgrade pynvim

# Install Node.js support for Neovim
echo -e "${YELLOW}Installing Node.js support for Neovim...${NC}"
sudo npm install -g neovim

# Install tree-sitter CLI (for syntax highlighting)
echo -e "${YELLOW}Installing tree-sitter CLI...${NC}"
sudo npm install -g tree-sitter-cli

# Install kickstart.nvim
echo -e "${YELLOW}Installing kickstart.nvim...${NC}"
NVIM_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

# Backup existing config if it exists
if [ -d "$NVIM_CONFIG_DIR" ]; then
    echo -e "${YELLOW}Backing up existing Neovim configuration...${NC}"
    mv "$NVIM_CONFIG_DIR" "${NVIM_CONFIG_DIR}_backup_$(date +%Y%m%d_%H%M%S)"
fi

sudo DEBIAN_FRONTEND=noninteractive apt install -y fuse

# Clone kickstart.nvim
git clone https://github.com/JoshuaGabriel/kickstart.nvim.git "$NVIM_CONFIG_DIR"

echo -e "${GREEN}Installation complete!${NC}"
echo -e "${YELLOW}You can now run Neovim with the 'nvim' command.${NC}"
echo -e "${YELLOW}First run will install all plugins automatically.${NC}"
echo -e "${GREEN}Enjoy your new Neovim nightly setup!${NC}" 