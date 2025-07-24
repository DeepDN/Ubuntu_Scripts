#!/bin/bash

# VLC Media Player Installation Script
# This script installs VLC media player

set -e

echo "Installing VLC Media Player..."

# Update package list
sudo apt update

# Install VLC
sudo apt install -y vlc

# Install additional codecs
sudo apt install -y ubuntu-restricted-extras

# Install VLC browser plugin
sudo apt install -y browser-plugin-vlc

echo "VLC Media Player installed successfully!"
echo "You can launch it from applications or run 'vlc' in terminal"
echo "VLC supports most multimedia files and streaming protocols"
