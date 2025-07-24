#!/bin/bash

# Google Chrome Installation Script
# This script installs Google Chrome browser

set -e

echo "Installing Google Chrome..."

# Update package list
sudo apt update

# Install required packages
sudo apt install -y wget gnupg

# Add Google Chrome repository key
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Add Google Chrome repository
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Update package list
sudo apt update

# Install Google Chrome
sudo apt install -y google-chrome-stable

# Verify installation
google-chrome --version

echo "Google Chrome installed successfully!"
echo "You can launch it from the applications menu or by typing 'google-chrome' in the terminal."
