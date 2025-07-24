#!/bin/bash

# Repository Fix Script
# This script fixes common repository issues

set -e

echo "🔧 Fixing repository issues..."

# Remove problematic repositories
echo "Removing problematic repositories..."

# Remove nginx-mainline PPA (403 Forbidden)
sudo add-apt-repository --remove ppa:ondrej/nginx-mainline -y 2>/dev/null || true

# Remove kazam PPA (no Release file)
sudo add-apt-repository --remove ppa:sylvain-pineau/kazam -y 2>/dev/null || true

# Clean up repository files
sudo rm -f /etc/apt/sources.list.d/ondrej-ubuntu-nginx-mainline-*.list 2>/dev/null || true
sudo rm -f /etc/apt/sources.list.d/sylvain-pineau-ubuntu-kazam-*.list 2>/dev/null || true

# Fix architecture issues by updating sources
echo "Fixing architecture configurations..."

# Update package lists
sudo apt update --fix-missing

# Clean package cache
sudo apt clean
sudo apt autoclean

# Fix broken packages
sudo apt --fix-broken install -y

echo "✅ Repository issues fixed!"
echo "You can now run the application installer scripts."
