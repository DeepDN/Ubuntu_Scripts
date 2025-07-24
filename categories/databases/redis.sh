#!/bin/bash

# Redis Installation Script
# This script installs Redis server and Redis CLI tools

set -e

echo "Installing Redis..."

# Update package list
sudo apt update

# Install Redis server
sudo apt install -y redis-server

# Install Redis tools
sudo apt install -y redis-tools

# Configure Redis for production use
sudo sed -i 's/^supervised no/supervised systemd/' /etc/redis/redis.conf

# Start and enable Redis service
sudo systemctl restart redis-server
sudo systemctl enable redis-server

# Install Redis GUI tools
sudo snap install redis-desktop-manager

# Install Python Redis client (optional)
pip3 install --user redis

# Install Node.js Redis client (if Node.js is available)
if command -v npm &> /dev/null; then
    npm install -g redis-cli
fi

# Test Redis connection
redis-cli ping

# Show Redis status
sudo systemctl status redis-server --no-pager

echo "Redis installed successfully!"
echo "Redis is running on port 6379"
echo "Redis Desktop Manager GUI is available in applications"
echo "Test connection: redis-cli ping"
echo "Redis configuration file: /etc/redis/redis.conf"
echo "Redis log file: /var/log/redis/redis-server.log"
