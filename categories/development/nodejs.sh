#!/bin/bash

# Node.js and NPM Installation Script
# This script installs the latest LTS version of Node.js and NPM

set -e

echo "Installing Node.js and NPM..."

# Update package list
sudo apt update

# Install curl if not present
sudo apt install -y curl

# Install Node.js using NodeSource repository
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# Install Yarn package manager
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install -y yarn

# Install useful global packages
sudo npm install -g @angular/cli
sudo npm install -g create-react-app
sudo npm install -g vue-cli
sudo npm install -g typescript
sudo npm install -g nodemon
sudo npm install -g pm2
sudo npm install -g eslint
sudo npm install -g prettier

# Verify installation
echo "Node.js version: $(node --version)"
echo "NPM version: $(npm --version)"
echo "Yarn version: $(yarn --version)"

echo "Node.js, NPM, and Yarn installed successfully!"
echo "Global packages installed: Angular CLI, Create React App, Vue CLI, TypeScript, Nodemon, PM2, ESLint, Prettier"
