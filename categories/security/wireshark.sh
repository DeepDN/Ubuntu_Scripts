#!/bin/bash

# Wireshark Installation Script
# This script installs Wireshark network protocol analyzer

set -e

echo "Installing Wireshark..."

# Update package list
sudo apt update

# Install Wireshark
sudo apt install -y wireshark

# Add current user to wireshark group for packet capture
sudo usermod -aG wireshark $USER

# Install additional network analysis tools
sudo apt install -y tshark tcpdump

# Install Wireshark plugins and additional tools
sudo apt install -y wireshark-dev

# Configure dumpcap permissions
sudo dpkg-reconfigure wireshark-common

# Install network utilities
sudo apt install -y netcat-openbsd ngrep

# Verify installation
wireshark --version | head -n 1
tshark --version | head -n 1

echo "Wireshark installed successfully!"
echo "Wireshark version: $(wireshark --version | head -n 1)"
echo "TShark version: $(tshark --version | head -n 1)"
echo "Additional tools installed: tshark, tcpdump, netcat, ngrep"
echo "User $USER added to wireshark group"
echo "Please log out and log back in for group changes to take effect"
echo "You can then capture packets without sudo"
