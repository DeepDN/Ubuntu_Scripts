#!/bin/bash

# Visual Studio Code Installation Script
# This script installs Visual Studio Code on Ubuntu

set -e

echo "Installing Visual Studio Code..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y wget gpg

# Add Microsoft GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

# Update package list with new repository
sudo apt update

# Install Visual Studio Code
sudo apt install -y code

# Install useful extensions
code --install-extension ms-python.python
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension bradlc.vscode-tailwindcss
code --install-extension esbenp.prettier-vscode
code --install-extension ms-vscode.vscode-json

echo "Visual Studio Code installed successfully!"
echo "You can launch it by typing 'code' in the terminal or finding it in applications."
