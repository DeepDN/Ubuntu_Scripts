#!/bin/bash

# AWS CLI Installation Script
# This script installs AWS CLI v2

set -e

echo "Installing AWS CLI v2..."

# Update package list
sudo apt update

# Install required packages
sudo apt install -y curl unzip

# Download AWS CLI v2
cd /tmp
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Extract and install
unzip awscliv2.zip
sudo ./aws/install

# Install AWS Session Manager Plugin
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
sudo dpkg -i session-manager-plugin.deb

# Install AWS SAM CLI
pip3 install --user aws-sam-cli

# Clean up
rm -rf aws awscliv2.zip session-manager-plugin.deb

# Verify installation
aws --version
sam --version

echo "AWS CLI v2 and related tools installed successfully!"
echo "Run 'aws configure' to set up your AWS credentials"
