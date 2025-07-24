#!/bin/bash

# Azure CLI Installation Script
# This script installs Azure CLI

set -e

echo "Installing Azure CLI..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y ca-certificates curl apt-transport-https lsb-release gnupg

# Add Microsoft signing key
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null

# Add Azure CLI repository
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list

# Update package list
sudo apt update

# Install Azure CLI
sudo apt install -y azure-cli

# Verify installation
az --version

echo "Azure CLI installed successfully!"
echo "Azure CLI version: $(az --version | head -n 1)"
echo "Login with: az login"
echo "Get help: az --help"
