#!/bin/bash

# Blender Installation Script
# This script installs Blender 3D creation suite

set -e

echo "Installing Blender..."

# Update package list
sudo apt update

# Install Blender via Snap (latest version)
sudo snap install blender --classic

# Alternative: Install via apt (may be older version)
# sudo apt install -y blender

echo "Blender installed successfully!"
echo "You can launch it from applications or run 'blender' in terminal"
echo "Blender is a free and open-source 3D creation suite"
