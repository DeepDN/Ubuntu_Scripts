#!/bin/bash

# Nikto Installation Script
# This script installs Nikto web server scanner

set -e

echo "Installing Nikto..."

# Update package list
sudo apt update

# Install Nikto
sudo apt install -y nikto

# Install additional web security tools
sudo apt install -y dirb dirbuster

# Update Nikto database
sudo nikto -update

echo "Nikto installed successfully!"
echo "Nikto version: $(nikto -Version)"
echo "Additional tools installed: dirb, dirbuster"
echo "Usage: nikto -h <target>"
echo "Database updated to latest version"
