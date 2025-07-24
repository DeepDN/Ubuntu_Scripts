#!/bin/bash

# FileZilla Installation Script
# This script installs FileZilla FTP client

set -e

echo "Installing FileZilla..."

# Update package list
sudo apt update

# Install FileZilla
sudo apt install -y filezilla

echo "FileZilla installed successfully!"
echo "You can launch it from applications or run 'filezilla' in terminal"
echo "FileZilla is a fast and reliable cross-platform FTP, FTPS and SFTP client"
