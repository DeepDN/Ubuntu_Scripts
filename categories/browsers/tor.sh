#!/bin/bash

# Tor Browser Installation Script
# This script installs Tor Browser for anonymous browsing

set -e

echo "Installing Tor Browser..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y wget gnupg

# Add Tor Project repository key
wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | sudo gpg --dearmor -o /usr/share/keyrings/tor-archive-keyring.gpg

# Add Tor repository
echo "deb [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/tor.list

# Update package list
sudo apt update

# Install Tor Browser Launcher
sudo apt install -y torbrowser-launcher

# Also install Tor service
sudo apt install -y tor

echo "Tor Browser installed successfully!"
echo "You can launch it from applications or run 'torbrowser-launcher' in terminal"
echo "Tor service is also installed for system-wide proxy support"
