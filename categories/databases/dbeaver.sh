#!/bin/bash

# DBeaver Installation Script
# This script installs DBeaver universal database tool

set -e

echo "Installing DBeaver..."

# Update package list
sudo apt update

# Install DBeaver via Snap
sudo snap install dbeaver-ce

# Alternative: Install via .deb package
# cd /tmp
# DBEAVER_VERSION=$(curl -s https://api.github.com/repos/dbeaver/dbeaver/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
# wget https://github.com/dbeaver/dbeaver/releases/download/${DBEAVER_VERSION}/dbeaver-ce_${DBEAVER_VERSION#v}_amd64.deb
# sudo dpkg -i dbeaver-ce_*.deb
# sudo apt-get install -f

echo "DBeaver installed successfully!"
echo "You can launch it from applications or run 'dbeaver' in terminal"
echo "DBeaver is a universal database tool for developers and database administrators"
