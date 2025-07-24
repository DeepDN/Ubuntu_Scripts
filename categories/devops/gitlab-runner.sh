#!/bin/bash

# GitLab Runner Installation Script
# This script installs GitLab Runner for CI/CD

set -e

echo "Installing GitLab Runner..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y curl

# Add GitLab Runner repository
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash

# Install GitLab Runner
sudo apt install -y gitlab-runner

# Start and enable GitLab Runner service
sudo systemctl start gitlab-runner
sudo systemctl enable gitlab-runner

# Show GitLab Runner status
sudo systemctl status gitlab-runner --no-pager

echo "GitLab Runner installed successfully!"
echo "GitLab Runner version: $(gitlab-runner --version)"
echo "To register a runner: sudo gitlab-runner register"
echo "Configuration file: /etc/gitlab-runner/config.toml"
echo "Check status: sudo systemctl status gitlab-runner"
