#!/bin/bash

# Nmap Installation Script
# This script installs Nmap network scanner and related tools

set -e

echo "Installing Nmap..."

# Update package list
sudo apt update

# Install Nmap and related tools
sudo apt install -y nmap ncat ndiff zenmap

# Install additional network tools
sudo apt install -y masscan zmap

# Install Nmap scripts and database updates
sudo nmap --script-updatedb

# Create useful aliases
echo "# Nmap aliases" >> ~/.bashrc
echo "alias nmap-quick='nmap -T4 -F'" >> ~/.bashrc
echo "alias nmap-intense='nmap -T4 -A -v'" >> ~/.bashrc
echo "alias nmap-comprehensive='nmap -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53 --script=default or (discovery and safe)'" >> ~/.bashrc

# Verify installation
nmap --version

echo "Nmap installed successfully!"
echo "Nmap version: $(nmap --version | head -n 1)"
echo "Installed tools: nmap, ncat, ndiff, zenmap, masscan, zmap"
echo "Useful aliases added to ~/.bashrc:"
echo "  - nmap-quick: Fast scan"
echo "  - nmap-intense: Intense scan with OS detection"
echo "  - nmap-comprehensive: Comprehensive scan"
echo "Please restart your terminal to use the aliases"
