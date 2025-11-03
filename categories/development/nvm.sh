#!/bin/bash

# NVM (Node Version Manager) Installation Script
# This script installs NVM and the latest LTS version of Node.js

set -e

echo "Installing NVM (Node Version Manager)..."

# Install dependencies
sudo apt-get update
sudo apt-get install -y curl

# Download and install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Reload bash profile
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install latest LTS Node.js
nvm install --lts
nvm use --lts
nvm alias default lts/*

# Verify installation
echo "NVM version: $(nvm --version)"
echo "Node.js version: $(node --version)"
echo "NPM version: $(npm --version)"

echo "NVM installed successfully!"
echo "Restart your terminal or run 'source ~/.bashrc' to use NVM"
echo "Usage:"
echo "  nvm install node    # Install latest Node.js"
echo "  nvm install 18      # Install specific version"
echo "  nvm use 18          # Switch to version 18"
echo "  nvm list            # List installed versions"
