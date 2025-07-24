#!/bin/bash

# Obsidian Installation Script
# This script installs Obsidian note-taking application

set -e

echo "Installing Obsidian..."

# Update package list
sudo apt update

# Install Obsidian via Snap
sudo snap install obsidian --classic

# Alternative: Install via .deb package
# cd /tmp
# OBSIDIAN_VERSION=$(curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | grep -oP '"tag_name": "v\K(.*)(?=")')
# wget https://github.com/obsidianmd/obsidian-releases/releases/download/v${OBSIDIAN_VERSION}/obsidian_${OBSIDIAN_VERSION}_amd64.deb
# sudo dpkg -i obsidian_*.deb
# sudo apt-get install -f

echo "Obsidian installed successfully!"
echo "You can launch it from applications or run 'obsidian' in terminal"
echo "Obsidian is a powerful knowledge base that works on top of local folder of plain text Markdown files"
