#!/bin/bash

# Zoom Installation Script
# This script installs Zoom video conferencing

set -e

echo "Installing Zoom..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y wget

# Download Zoom
cd /tmp
wget https://zoom.us/client/latest/zoom_amd64.deb

# Install Zoom
sudo dpkg -i zoom_amd64.deb
sudo apt-get install -f

# Clean up
rm -f zoom_amd64.deb

echo "Zoom installed successfully!"
echo "You can launch it from applications or run 'zoom' in terminal"
