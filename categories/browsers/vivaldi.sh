#!/bin/bash

# Vivaldi Browser Installation Script
# This script installs Vivaldi Browser

set -e

echo "Installing Vivaldi Browser..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y wget gnupg

# Add Vivaldi repository key
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/vivaldi-browser.gpg

# Add Vivaldi repository
echo "deb [signed-by=/usr/share/keyrings/vivaldi-browser.gpg arch=amd64] https://repo.vivaldi.com/archive/deb/ stable main" | sudo tee /etc/apt/sources.list.d/vivaldi-archive.list

# Update package list
sudo apt update

# Install Vivaldi
sudo apt install -y vivaldi-stable

echo "Vivaldi Browser installed successfully!"
echo "You can launch it from applications or run 'vivaldi' in terminal"
