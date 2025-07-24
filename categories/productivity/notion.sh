#!/bin/bash

# Notion Installation Script
# This script installs Notion desktop application

set -e

echo "Installing Notion..."

# Update package list
sudo apt update

# Install Notion via Snap
sudo snap install notion-snap

# Alternative: Install via AppImage
# cd /tmp
# wget https://github.com/notion-enhancer/desktop/releases/latest/download/notion-app-enhanced.AppImage
# chmod +x notion-app-enhanced.AppImage
# sudo mv notion-app-enhanced.AppImage /opt/notion
# sudo ln -sf /opt/notion /usr/local/bin/notion

echo "Notion installed successfully!"
echo "You can launch it from applications"
echo "Notion is a powerful workspace for notes, tasks, wikis, and databases"
