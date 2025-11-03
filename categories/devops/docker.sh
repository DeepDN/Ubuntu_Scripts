#!/bin/bash

# Docker Installation Script - Official Method
# This script installs Docker Engine using Docker's official installation method

set -e

echo "Installing Docker Engine (Official Method)..."

# Uninstall old versions
sudo apt-get remove -y docker docker-engine docker.io containerd runc 2>/dev/null || true

# Update package index
sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install -y ca-certificates curl

# Add Docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index
sudo apt-get update

# Install Docker Engine, containerd, and Docker Compose
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add current user to docker group
sudo usermod -aG docker $USER

# Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Verify installation
echo "Docker version: $(docker --version)"
echo "Docker Compose version: $(docker compose version)"

echo "Docker Engine installed successfully!"
echo "Please log out and log back in for group changes to take effect."
echo "Test installation with: docker run hello-world"
