#!/bin/bash

# Microsoft Edge Installation Script
# This script installs Microsoft Edge browser

set -e

echo "Installing Microsoft Edge..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y wget gnupg

# Add Microsoft Edge repository key
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/

# Add Microsoft Edge repository
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'

# Update package list
sudo apt update

# Install Microsoft Edge
sudo apt install -y microsoft-edge-stable

# Clean up
rm -f microsoft.gpg

echo "Microsoft Edge installed successfully!"
echo "You can launch it from applications or run 'microsoft-edge' in terminal"
