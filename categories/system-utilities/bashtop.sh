#!/bin/bash

# Bashtop Installation Script
# This script installs Bashtop resource monitor

set -e

echo "Installing Bashtop..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y python3-pip

# Install Bashtop via pip
pip3 install --user bashtop

# Alternative: Install via snap
# sudo snap install bashtop

# Install btop (C++ version, more efficient)
sudo apt install -y btop

# Add to PATH if not already there
if ! echo $PATH | grep -q "$HOME/.local/bin"; then
    echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc
fi

echo "Bashtop and btop installed successfully!"
echo "Run 'bashtop' for Python version or 'btop' for C++ version"
echo "Both are resource monitors with beautiful terminal interfaces"
echo "Please restart your terminal or run 'source ~/.bashrc' to update PATH"
