#!/bin/bash

# Terraform Installation Script
# This script installs HashiCorp Terraform

set -e

echo "Installing Terraform..."

# Update package list
sudo apt update

# Install required packages
sudo apt install -y gnupg software-properties-common curl

# Add HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

# Add HashiCorp repository
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Update package list
sudo apt update

# Install Terraform
sudo apt install -y terraform

# Install Terraform docs (optional)
sudo apt install -y terraform-docs

# Verify installation
terraform version

echo "Terraform installed successfully!"
echo "You can verify the installation by running 'terraform --help'"
