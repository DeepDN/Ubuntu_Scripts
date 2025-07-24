#!/bin/bash

# Burp Suite Community Edition Installation Script
# This script installs Burp Suite Community Edition

set -e

echo "Installing Burp Suite Community Edition..."

# Update package list
sudo apt update

# Install Java (required for Burp Suite)
sudo apt install -y openjdk-11-jdk

# Create directory for Burp Suite
sudo mkdir -p /opt/burpsuite

# Download Burp Suite Community Edition
cd /tmp
wget "https://portswigger.net/burp/releases/download?product=community&type=Linux" -O burpsuite_community_linux.sh

# Make installer executable and run it
chmod +x burpsuite_community_linux.sh

# Install Burp Suite (automated installation)
sudo ./burpsuite_community_linux.sh -q -dir /opt/burpsuite

# Create symbolic link
sudo ln -sf /opt/burpsuite/BurpSuiteCommunity /usr/local/bin/burpsuite

# Create desktop entry
cat > ~/.local/share/applications/burpsuite.desktop << EOF
[Desktop Entry]
Name=Burp Suite Community
GenericName=Web Security Testing
Comment=Web Application Security Testing
Exec=/opt/burpsuite/BurpSuiteCommunity
Icon=/opt/burpsuite/burpsuite_community.png
Terminal=false
Type=Application
Categories=Development;Security;
EOF

chmod +x ~/.local/share/applications/burpsuite.desktop

# Clean up
rm -f /tmp/burpsuite_community_linux.sh

echo "Burp Suite Community Edition installed successfully!"
echo "You can launch it by typing 'burpsuite' in the terminal or finding it in applications."
echo "Note: This is the Community Edition with limited features"
echo "For full features, consider upgrading to Burp Suite Professional"
