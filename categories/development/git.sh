#!/bin/bash

# Git Installation Script - Latest Official Method
# This script installs Git and GitHub CLI using official repositories

set -e

echo "Installing Git and GitHub CLI..."

# Update package index
sudo apt-get update

# Install Git from official Ubuntu repository
sudo apt-get install -y git git-lfs

# Install GitHub CLI using official method
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# Update and install GitHub CLI
sudo apt-get update
sudo apt-get install -y gh

# Configure Git LFS
git lfs install --system

# Install additional Git tools
sudo apt-get install -y gitk git-gui

# Verify installation
echo "Git version: $(git --version)"
echo "GitHub CLI version: $(gh --version)"
echo "Git LFS version: $(git lfs version)"

echo "Git and GitHub CLI installed successfully!"
echo ""
echo "Next steps:"
echo "1. Configure Git:"
echo "   git config --global user.name 'Your Name'"
echo "   git config --global user.email 'your.email@example.com'"
echo "2. Authenticate with GitHub:"
echo "   gh auth login"
echo "3. Set up SSH key (optional):"
echo "   ssh-keygen -t ed25519 -C 'your.email@example.com'"
