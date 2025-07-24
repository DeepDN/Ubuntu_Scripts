#!/bin/bash

# Brave Browser Installation Script
# This script installs Brave Browser

set -e

echo "Installing Brave Browser..."

# Update package list
sudo apt update

# Install required packages
sudo apt install -y curl gnupg

# Add Brave repository key
curl -fsSL https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/brave-browser-archive-keyring.gpg

# Add Brave repository
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Update package list
sudo apt update

# Install Brave Browser
sudo apt install -y brave-browser

# Verify installation
brave-browser --version

echo "Brave Browser installed successfully!"
echo "You can launch it from the applications menu or by typing 'brave-browser' in the terminal."
