#!/bin/bash

# MongoDB Installation Script
# This script installs MongoDB Community Edition and MongoDB Compass

set -e

echo "Installing MongoDB..."

# Update package list
sudo apt update

# Install required packages
sudo apt install -y wget curl gnupg2 software-properties-common apt-transport-https ca-certificates lsb-release

# Import MongoDB public GPG key
curl -fsSL https://pgp.mongodb.com/server-6.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg --dearmor

# Add MongoDB repository
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Update package list
sudo apt update

# Install MongoDB
sudo apt install -y mongodb-org

# Start and enable MongoDB service
sudo systemctl start mongod
sudo systemctl enable mongod

# Install MongoDB Compass (GUI)
cd /tmp
wget https://downloads.mongodb.com/compass/mongodb-compass_1.39.4_amd64.deb
sudo dpkg -i mongodb-compass_1.39.4_amd64.deb
sudo apt-get install -f

# Install MongoDB Shell (mongosh)
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
sudo apt install -y mongodb-mongosh

# Clean up
rm -f /tmp/mongodb-compass_1.39.4_amd64.deb

# Verify installation
mongod --version
mongosh --version

echo "MongoDB installed successfully!"
echo "MongoDB is running on port 27017"
echo "Use 'mongosh' to connect to MongoDB shell"
echo "MongoDB Compass GUI is available in applications"
