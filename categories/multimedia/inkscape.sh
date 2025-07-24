#!/bin/bash

# Inkscape Installation Script
# This script installs Inkscape vector graphics editor

set -e

echo "Installing Inkscape..."

# Update package list
sudo apt update

# Install Inkscape
sudo apt install -y inkscape

# Install additional extensions and templates
sudo apt install -y inkscape-open-symbols

echo "Inkscape installed successfully!"
echo "You can launch it from applications or run 'inkscape' in terminal"
echo "Inkscape is a professional vector graphics editor"
