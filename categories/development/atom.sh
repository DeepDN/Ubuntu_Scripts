#!/bin/bash

# Atom Editor Installation Script
# This script installs Atom text editor (Note: Atom is deprecated, but still available)

set -e

echo "Installing Atom Editor..."
echo "Note: Atom has been deprecated by GitHub. Consider using VS Code or other alternatives."

# Update package list
sudo apt update

# Install Atom via Snap
sudo snap install atom --classic

# Alternative: Install via .deb package (if available)
# cd /tmp
# wget https://github.com/atom/atom/releases/latest/download/atom-amd64.deb
# sudo dpkg -i atom-amd64.deb
# sudo apt-get install -f

echo "Atom Editor installed successfully!"
echo "You can launch it from applications or run 'atom' in terminal"
echo "Warning: Atom is deprecated. Consider migrating to VS Code or other editors."
