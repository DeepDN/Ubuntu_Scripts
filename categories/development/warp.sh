#!/bin/bash

# Warp Terminal Installation Script
# This script installs Warp - The terminal for the 21st century

set -e

echo "Installing Warp Terminal..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y wget gnupg

# Download Warp
cd /tmp
wget https://releases.warp.dev/stable/v0.2023.11.14.08.02.stable_01/warp-terminal_0.2023.11.14.08.02.stable.01_amd64.deb

# Install Warp
sudo dpkg -i warp-terminal_*.deb
sudo apt-get install -f

# Clean up
rm -f warp-terminal_*.deb

echo "Warp Terminal installed successfully!"
echo "You can launch it from applications or run 'warp-terminal' in terminal"
echo "Features: AI-powered terminal, modern UI, collaborative features"
echo "Note: Warp requires account registration for full features"
