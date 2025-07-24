#!/bin/bash

# MariaDB Installation Script
# This script installs MariaDB database server

set -e

echo "Installing MariaDB..."

# Update package list
sudo apt update

# Install MariaDB server
sudo apt install -y mariadb-server mariadb-client

# Start and enable MariaDB service
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Secure MariaDB installation
sudo mysql_secure_installation

# Install additional tools
sudo apt install -y mycli

# Create a sample database and user
echo "Creating sample database and user..."
sudo mysql -e "CREATE DATABASE IF NOT EXISTS testdb;"
sudo mysql -e "CREATE USER IF NOT EXISTS 'testuser'@'localhost' IDENTIFIED BY 'testpass';"
sudo mysql -e "GRANT ALL PRIVILEGES ON testdb.* TO 'testuser'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Show MariaDB status
sudo systemctl status mariadb --no-pager

echo "MariaDB installed successfully!"
echo "MariaDB is running on port 3306"
echo "Sample database 'testdb' created with user 'testuser' (password: testpass)"
echo "Use 'mysql -u root -p' to access MariaDB as root"
echo "Use 'mycli -u testuser -p testpass testdb' for enhanced CLI experience"
