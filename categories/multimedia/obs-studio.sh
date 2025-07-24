#!/bin/bash

# OBS Studio Installation Script
# This script installs OBS Studio for streaming and recording

set -e

echo "Installing OBS Studio..."

# Update package list
sudo apt update

# Add OBS Studio PPA
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt update

# Install OBS Studio
sudo apt install -y obs-studio

# Install additional plugins
sudo apt install -y obs-plugins

echo "OBS Studio installed successfully!"
echo "You can launch it from applications or run 'obs' in terminal"
echo "OBS Studio is perfect for live streaming and screen recording"
