#!/bin/bash

# Spotify Installation Script
# This script installs Spotify music streaming client

set -e

echo "Installing Spotify..."

# Update package list
sudo apt update

# Install Spotify via Snap
sudo snap install spotify

# Alternative: Install via .deb package
# curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor -o /usr/share/keyrings/spotify-archive-keyring.gpg
# echo "deb [signed-by=/usr/share/keyrings/spotify-archive-keyring.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
# sudo apt update
# sudo apt install -y spotify-client

echo "Spotify installed successfully!"
echo "You can launch it from applications or run 'spotify' in terminal"
