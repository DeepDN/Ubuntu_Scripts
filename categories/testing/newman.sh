#!/bin/bash

# Newman Installation Script
# This script installs Newman (Postman CLI)

set -e

echo "Installing Newman..."

# Update package list
sudo apt update

# Install Node.js if not present
if ! command -v node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt install -y nodejs
fi

# Install Newman globally
sudo npm install -g newman

# Install Newman HTML reporter
sudo npm install -g newman-reporter-html

# Install additional API testing tools
sudo npm install -g insomnia-cli

echo "Newman installed successfully!"
echo "Newman version: $(newman --version)"
echo "Additional tools installed:"
echo "  - newman-reporter-html: HTML reports"
echo "  - insomnia-cli: Insomnia CLI"
echo "Usage: newman run <collection.json>"
