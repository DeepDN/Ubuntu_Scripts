#!/bin/bash

# Microsoft Teams Installation Script
# This script installs Microsoft Teams

set -e

echo "Installing Microsoft Teams..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y wget gnupg

# Add Microsoft repository key
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/

# Add Microsoft repository
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'

# Update package list
sudo apt update

# Install Teams
sudo apt install -y teams

# Clean up
rm -f microsoft.gpg

echo "Microsoft Teams installed successfully!"
echo "You can launch it from applications or run 'teams' in terminal"
