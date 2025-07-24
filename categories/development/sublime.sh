#!/bin/bash

# Sublime Text Installation Script
# This script installs Sublime Text editor

set -e

echo "Installing Sublime Text..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y wget gnupg apt-transport-https

# Add Sublime Text repository key
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o /usr/share/keyrings/sublimehq-archive.gpg

# Add Sublime Text repository
echo "deb [signed-by=/usr/share/keyrings/sublimehq-archive.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Update package list
sudo apt update

# Install Sublime Text
sudo apt install -y sublime-text

echo "Sublime Text installed successfully!"
echo "You can launch it from applications or run 'subl' in terminal"
echo "To install Package Control, use Ctrl+Shift+P and type 'Install Package Control'"
