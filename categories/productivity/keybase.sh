#!/bin/bash

# Keybase Installation Script
# This script installs Keybase secure messaging and file sharing

set -e

echo "Installing Keybase..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y curl gnupg

# Add Keybase repository key
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb

# Install Keybase
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f

# Install Keybase filesystem (KBFS)
run_keybase

# Clean up
rm -f keybase_amd64.deb

echo "Keybase installed successfully!"
echo "You can launch it from applications or run 'keybase' in terminal"
echo "To set up: keybase signup or keybase login"
echo "Features: Encrypted chat, file sharing, Git repositories, cryptocurrency wallet"
