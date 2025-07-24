#!/bin/bash

# SQLMap Installation Script
# This script installs SQLMap SQL injection testing tool

set -e

echo "Installing SQLMap..."

# Update package list
sudo apt update

# Install SQLMap
sudo apt install -y sqlmap

# Install Python dependencies
sudo apt install -y python3-pip

# Install additional SQL injection tools
pip3 install --user sqlparse

echo "SQLMap installed successfully!"
echo "SQLMap version: $(sqlmap --version)"
echo "Usage: sqlmap -u <URL>"
echo "Additional tools: sqlparse"
echo "Documentation: https://sqlmap.org/"
