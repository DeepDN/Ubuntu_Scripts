#!/bin/bash

# Audacity Installation Script
# This script installs Audacity audio editor

set -e

echo "Installing Audacity..."

# Update package list
sudo apt update

# Install Audacity
sudo apt install -y audacity

# Install additional audio codecs
sudo apt install -y lame ffmpeg

echo "Audacity installed successfully!"
echo "You can launch it from applications or run 'audacity' in terminal"
echo "Audacity is a free, open source, cross-platform audio software"
