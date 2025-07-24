#!/bin/bash

# Ruby Development Environment Installation Script
# This script installs Ruby and Rails development environment

set -e

echo "Installing Ruby development environment..."

# Update package list
sudo apt update

# Install Ruby and development dependencies
sudo apt install -y ruby-full ruby-dev build-essential

# Install RubyGems and Bundler
sudo gem install bundler

# Install Rails
sudo gem install rails

# Install additional Ruby tools
sudo gem install rubocop
sudo gem install rspec
sudo gem install pry

# Install Node.js (required for Rails asset pipeline)
if ! command -v node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt install -y nodejs
fi

# Install Yarn (for Rails 6+)
if ! command -v yarn &> /dev/null; then
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt update
    sudo apt install -y yarn
fi

# Verify installation
ruby --version
rails --version
bundler --version

echo "Ruby development environment installed successfully!"
echo "Ruby version: $(ruby --version)"
echo "Rails version: $(rails --version)"
echo "Bundler version: $(bundler --version)"
echo "Additional tools: rubocop, rspec, pry"
