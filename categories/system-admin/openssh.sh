#!/bin/bash

# OpenSSH Server Installation Script
# This script installs and configures OpenSSH server

set -e

echo "Installing OpenSSH Server..."

# Update package list
sudo apt update

# Install OpenSSH server
sudo apt install -y openssh-server

# Start and enable SSH service
sudo systemctl start ssh
sudo systemctl enable ssh

# Create backup of SSH config
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup

# Basic security configuration
sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Restart SSH service
sudo systemctl restart ssh

# Show SSH status
sudo systemctl status ssh --no-pager

echo "OpenSSH Server installed successfully!"
echo "SSH server is running on port 22"
echo "Root login is disabled for security"
echo "Connect with: ssh username@server_ip"
echo "Configuration file: /etc/ssh/sshd_config"
echo "Check status: sudo systemctl status ssh"
