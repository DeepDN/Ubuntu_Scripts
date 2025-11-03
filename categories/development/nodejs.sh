#!/bin/bash

# Node.js Installation Script - NVM Method (Recommended)
# This script installs Node.js using NVM (Node Version Manager)

set -e

echo "Installing Node.js via NVM (Node Version Manager)..."
echo "NVM allows you to install and manage multiple Node.js versions"

# Check if NVM is already installed
if command -v nvm &> /dev/null; then
    echo "NVM is already installed. Installing latest LTS Node.js..."
    nvm install --lts
    nvm use --lts
    nvm alias default lts/*
else
    echo "Installing NVM first..."
    
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
fi

# Install useful global packages
npm install -g @angular/cli create-react-app typescript nodemon pm2 eslint prettier

# Verify installation
echo "NVM version: $(nvm --version)"
echo "Node.js version: $(node --version)"
echo "NPM version: $(npm --version)"

echo "Node.js installed successfully via NVM!"
echo ""
echo "Restart your terminal or run 'source ~/.bashrc' to use NVM"
echo "Useful NVM commands:"
echo "  nvm install 18      # Install Node.js v18"
echo "  nvm use 18          # Switch to Node.js v18"
echo "  nvm list            # List installed versions"
echo "  nvm current         # Show current version"
