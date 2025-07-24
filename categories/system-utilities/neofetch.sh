#!/bin/bash

# Neofetch Installation Script
# This script installs Neofetch system information tool

set -e

echo "Installing Neofetch..."

# Update package list
sudo apt update

# Install Neofetch
sudo apt install -y neofetch

# Install additional system info tools
sudo apt install -y screenfetch inxi

# Create alias for easy access
echo "alias sysinfo='neofetch'" >> ~/.bashrc

echo "Neofetch installed successfully!"
echo "Run 'neofetch' to display system information"
echo "Additional tools installed: screenfetch, inxi"
echo "Alias 'sysinfo' added to ~/.bashrc"
