#!/bin/bash

# Git and GitHub CLI Installation Script
# This script installs Git version control and GitHub CLI

set -e

echo "Installing Git and GitHub CLI..."

# Update package list
sudo apt update

# Install Git
sudo apt install -y git

# Install GitHub CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt update
sudo apt install -y gh

# Install Git LFS (Large File Storage)
sudo apt install -y git-lfs

# Configure Git LFS
git lfs install

# Install additional Git tools
sudo apt install -y gitk git-gui

# Verify installation
echo "Git version: $(git --version)"
echo "GitHub CLI version: $(gh --version)"

echo "Git and GitHub CLI installed successfully!"
echo "Configure Git with:"
echo "  git config --global user.name 'Your Name'"
echo "  git config --global user.email 'your.email@example.com'"
echo "Authenticate with GitHub using: gh auth login"
