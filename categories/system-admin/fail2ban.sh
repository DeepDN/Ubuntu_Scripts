#!/bin/bash

# Fail2ban Installation Script
# This script installs Fail2ban intrusion prevention system

set -e

echo "Installing Fail2ban..."

# Update package list
sudo apt update

# Install Fail2ban
sudo apt install -y fail2ban

# Create local configuration file
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Configure basic settings
sudo tee /etc/fail2ban/jail.local > /dev/null << EOF
[DEFAULT]
bantime = 3600
findtime = 600
maxretry = 3
backend = systemd

[sshd]
enabled = true
port = ssh
logpath = %(sshd_log)s
backend = %(sshd_backend)s

[nginx-http-auth]
enabled = true

[nginx-limit-req]
enabled = true

[apache-auth]
enabled = true

[apache-badbots]
enabled = true
EOF

# Start and enable Fail2ban
sudo systemctl start fail2ban
sudo systemctl enable fail2ban

# Check status
sudo systemctl status fail2ban --no-pager

echo "Fail2ban installed successfully!"
echo "Configuration file: /etc/fail2ban/jail.local"
echo "Check status: sudo fail2ban-client status"
echo "Check specific jail: sudo fail2ban-client status sshd"
echo "Unban IP: sudo fail2ban-client set sshd unbanip <IP>"
