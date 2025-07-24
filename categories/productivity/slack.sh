#!/bin/bash

# Slack Installation Script
# This script installs Slack desktop application

set -e

echo "Installing Slack..."

# Update package list
sudo apt update

# Install Slack via Snap (recommended method)
sudo snap install slack --classic

# Alternative: Install via .deb package
# cd /tmp
# wget https://downloads.slack-edge.com/releases/linux/4.34.119/prod/x64/slack-desktop-4.34.119-amd64.deb
# sudo dpkg -i slack-desktop-*.deb
# sudo apt-get install -f

echo "Slack installed successfully!"
echo "You can launch it from applications or run 'slack' in terminal"
