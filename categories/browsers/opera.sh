#!/bin/bash

# Opera Browser Installation Script
# This script installs Opera Browser

set -e

echo "Installing Opera Browser..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y wget gnupg

# Add Opera repository key
wget -qO- https://deb.opera.com/archive.key | sudo gpg --dearmor -o /usr/share/keyrings/opera-browser.gpg

# Add Opera repository
echo "deb [signed-by=/usr/share/keyrings/opera-browser.gpg] https://deb.opera.com/opera-stable/ stable non-free" | sudo tee /etc/apt/sources.list.d/opera-stable.list

# Update package list
sudo apt update

# Install Opera
sudo apt install -y opera-stable

echo "Opera Browser installed successfully!"
echo "You can launch it from applications or run 'opera' in terminal"
