#!/bin/bash

# Google Cloud SDK Installation Script
# This script installs Google Cloud SDK

set -e

echo "Installing Google Cloud SDK..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y apt-transport-https ca-certificates gnupg

# Add Google Cloud SDK repository key
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import Google Cloud public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

# Update package list
sudo apt update

# Install Google Cloud SDK
sudo apt install -y google-cloud-cli

# Install additional components
sudo apt install -y google-cloud-cli-kubectl google-cloud-cli-gke-gcloud-auth-plugin

# Verify installation
gcloud --version

echo "Google Cloud SDK installed successfully!"
echo "gcloud version: $(gcloud --version | head -n 1)"
echo "Initialize with: gcloud init"
echo "Login with: gcloud auth login"
