#!/bin/bash

# Htop Installation Script
# This script installs htop and related system monitoring tools

set -e

echo "Installing Htop and system monitoring tools..."

# Update package list
sudo apt update

# Install htop and related tools
sudo apt install -y htop btop bashtop

# Install additional process monitoring tools
sudo apt install -y iotop iftop nethogs

# Install system information tools
sudo apt install -y neofetch screenfetch

# Create useful aliases
echo "# System monitoring aliases" >> ~/.bashrc
echo "alias top='htop'" >> ~/.bashrc
echo "alias processes='htop'" >> ~/.bashrc
echo "alias sysinfo='neofetch'" >> ~/.bashrc

# Verify installation
htop --version
btop --version

echo "Htop and system monitoring tools installed successfully!"
echo "Installed tools:"
echo "  - htop: Interactive process viewer"
echo "  - btop: Modern resource monitor"
echo "  - bashtop: Bash-based system monitor"
echo "  - iotop: I/O monitoring"
echo "  - iftop: Network bandwidth monitoring"
echo "  - nethogs: Network usage by process"
echo "  - neofetch: System information display"
echo "Aliases added to ~/.bashrc - restart terminal to use them"
