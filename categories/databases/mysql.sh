#!/bin/bash

# MySQL Installation Script
# This script installs MySQL server and MySQL Workbench

set -e

echo "Installing MySQL..."

# Update package list
sudo apt update

# Install MySQL server
sudo apt install -y mysql-server

# Secure MySQL installation
sudo mysql_secure_installation

# Install MySQL Workbench
sudo apt install -y mysql-workbench-community

# Install additional MySQL tools
sudo apt install -y mysql-client mycli

# Start and enable MySQL service
sudo systemctl start mysql
sudo systemctl enable mysql

# Create a sample database and user (optional)
echo "Creating sample database and user..."
sudo mysql -e "CREATE DATABASE IF NOT EXISTS testdb;"
sudo mysql -e "CREATE USER IF NOT EXISTS 'testuser'@'localhost' IDENTIFIED BY 'testpass';"
sudo mysql -e "GRANT ALL PRIVILEGES ON testdb.* TO 'testuser'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Show MySQL status
sudo systemctl status mysql --no-pager

echo "MySQL installed successfully!"
echo "MySQL is running on port 3306"
echo "MySQL Workbench GUI is available in applications"
echo "Sample database 'testdb' created with user 'testuser' (password: testpass)"
echo "Use 'mysql -u root -p' to access MySQL as root"
echo "Use 'mycli -u testuser -p testpass testdb' for enhanced CLI experience"
