#!/bin/bash

# Kdenlive Installation Script
# This script installs Kdenlive video editor

set -e

echo "Installing Kdenlive..."

# Update package list
sudo apt update

# Install Kdenlive
sudo apt install -y kdenlive

# Install additional codecs and plugins
sudo apt install -y frei0r-plugins

# Install additional multimedia libraries
sudo apt install -y ffmpeg

echo "Kdenlive installed successfully!"
echo "You can launch it from applications or run 'kdenlive' in terminal"
echo "Kdenlive is a powerful video editing software"
