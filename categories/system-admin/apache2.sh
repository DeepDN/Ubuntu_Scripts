#!/bin/bash

# Apache2 Installation Script
# This script installs Apache2 web server

set -e

echo "Installing Apache2..."

# Update package list
sudo apt update

# Install Apache2
sudo apt install -y apache2

# Install additional Apache modules
sudo apt install -y apache2-utils

# Start and enable Apache2
sudo systemctl start apache2
sudo systemctl enable apache2

# Configure firewall
sudo ufw allow 'Apache Full'

# Enable useful modules
sudo a2enmod rewrite
sudo a2enmod ssl
sudo a2enmod headers

# Check Apache status
sudo systemctl status apache2 --no-pager

echo "Apache2 installed successfully!"
echo "Apache2 is running on port 80 (HTTP) and 443 (HTTPS)"
echo "Default document root: /var/www/html"
echo "Configuration files: /etc/apache2/"
echo "Test configuration: sudo apache2ctl configtest"
echo "Reload configuration: sudo systemctl reload apache2"
