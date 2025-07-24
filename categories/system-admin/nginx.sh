#!/bin/bash

# Nginx Installation Script
# This script installs Nginx web server

set -e

echo "Installing Nginx..."

# Update package list
sudo apt update

# Install Nginx
sudo apt install -y nginx

# Start and enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Configure firewall
sudo ufw allow 'Nginx Full'

# Create a basic configuration backup
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup

# Install additional Nginx modules
sudo apt install -y nginx-extras

# Check Nginx status
sudo systemctl status nginx --no-pager

echo "Nginx installed successfully!"
echo "Nginx is running on port 80 (HTTP) and 443 (HTTPS)"
echo "Default document root: /var/www/html"
echo "Configuration files: /etc/nginx/"
echo "Test configuration: sudo nginx -t"
echo "Reload configuration: sudo systemctl reload nginx"
