#!/bin/bash

# Essential System Utilities Installation Script
# This script installs commonly used system utilities and tools

set -e

echo "Installing essential system utilities..."

# Update package list
sudo apt update

# Archive and compression tools
sudo apt install -y zip unzip rar unrar p7zip-full p7zip-rar

# Network tools
sudo apt install -y curl wget netcat-openbsd nmap wireshark

# System monitoring and information
sudo apt install -y htop neofetch tree glances iotop

# Text processing and development utilities
sudo apt install -y jq httpie bat fd-find ripgrep

# File management
sudo apt install -y ranger mc filezilla

# Media tools
sudo apt install -y ffmpeg imagemagick

# System utilities
sudo apt install -y software-properties-common apt-transport-https ca-certificates gnupg lsb-release

# Development tools
sudo apt install -y build-essential cmake make

# Git and version control
sudo apt install -y git git-lfs

# Text editors
sudo apt install -y vim nano

# Create symbolic links for better command names
sudo ln -sf /usr/bin/batcat /usr/local/bin/bat
sudo ln -sf /usr/bin/fdfind /usr/local/bin/fd

echo "Essential system utilities installed successfully!"
echo "Installed tools include:"
echo "- Archive tools: zip, unzip, 7zip, rar"
echo "- Network tools: curl, wget, netcat, nmap"
echo "- Monitoring: htop, neofetch, tree, glances"
echo "- Text processing: jq, httpie, bat, ripgrep"
echo "- File management: ranger, mc, filezilla"
echo "- Media tools: ffmpeg, imagemagick"
echo "- Development: build-essential, cmake, git"
