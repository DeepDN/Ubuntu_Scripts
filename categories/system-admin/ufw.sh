#!/bin/bash

# UFW Firewall Installation Script
# This script installs and configures UFW firewall

set -e

echo "Installing UFW Firewall..."

# Update package list
sudo apt update

# Install UFW (usually pre-installed)
sudo apt install -y ufw

# Install GUFW (GUI for UFW)
sudo apt install -y gufw

# Basic UFW configuration
sudo ufw --force reset
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH
sudo ufw allow ssh

# Allow common ports
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Enable UFW
sudo ufw --force enable

# Show status
sudo ufw status verbose

echo "UFW Firewall installed and configured successfully!"
echo "UFW is now active with basic security rules"
echo "GUI application (GUFW) is also installed"
echo "Check status: sudo ufw status"
echo "Allow port: sudo ufw allow <port>"
echo "Deny port: sudo ufw deny <port>"
