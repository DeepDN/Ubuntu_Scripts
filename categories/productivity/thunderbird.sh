#!/bin/bash

# Thunderbird Installation Script
# This script installs Thunderbird email client

set -e

echo "Installing Thunderbird..."

# Update package list
sudo apt update

# Install Thunderbird
sudo apt install -y thunderbird

echo "Thunderbird installed successfully!"
echo "You can launch it from applications or run 'thunderbird' in terminal"
echo "Thunderbird is a free email application that's easy to set up and customize"
