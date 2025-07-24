#!/bin/bash

# GIMP Installation Script
# This script installs GIMP image editor

set -e

echo "Installing GIMP..."

# Update package list
sudo apt update

# Install GIMP
sudo apt install -y gimp

# Install additional GIMP plugins and resources
sudo apt install -y gimp-data-extras gimp-plugin-registry

# Install GIMP help documentation
sudo apt install -y gimp-help-en

echo "GIMP installed successfully!"
echo "You can launch it from applications or run 'gimp' in terminal"
echo "GIMP is a powerful image manipulation program"
