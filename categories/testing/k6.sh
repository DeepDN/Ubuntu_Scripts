#!/bin/bash

# K6 Installation Script
# This script installs K6 load testing tool

set -e

echo "Installing K6..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y gnupg software-properties-common

# Add K6 repository key
sudo gpg -k
sudo gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69

# Add K6 repository
echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list

# Update package list
sudo apt update

# Install K6
sudo apt install -y k6

echo "K6 installed successfully!"
echo "K6 version: $(k6 version)"
echo "Usage: k6 run script.js"
echo "Documentation: https://k6.io/docs/"
