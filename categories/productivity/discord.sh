#!/bin/bash

# Discord Installation Script
# This script installs Discord desktop application

set -e

echo "Installing Discord..."

# Update package list
sudo apt update

# Install Discord via Snap
sudo snap install discord

# Alternative: Install via .deb package
# cd /tmp
# wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
# sudo dpkg -i discord.deb
# sudo apt-get install -f

echo "Discord installed successfully!"
echo "You can launch it from applications or run 'discord' in terminal"
