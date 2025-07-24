#!/bin/bash

# OWASP ZAP Installation Script
# This script installs OWASP Zed Attack Proxy

set -e

echo "Installing OWASP ZAP..."

# Update package list
sudo apt update

# Install Java (required for ZAP)
sudo apt install -y openjdk-11-jdk

# Create directory for ZAP
sudo mkdir -p /opt/zaproxy

# Get the latest ZAP version
ZAP_VERSION=$(curl -s https://api.github.com/repos/zaproxy/zaproxy/releases/latest | grep -oP '"tag_name": "v\K(.*)(?=")')

# Download ZAP
cd /tmp
wget https://github.com/zaproxy/zaproxy/releases/download/v${ZAP_VERSION}/ZAP_${ZAP_VERSION}_Linux.tar.gz

# Extract ZAP
sudo tar -xzf ZAP_${ZAP_VERSION}_Linux.tar.gz -C /opt/zaproxy --strip-components=1

# Create symbolic link
sudo ln -sf /opt/zaproxy/zap.sh /usr/local/bin/zap

# Create desktop entry
cat > ~/.local/share/applications/zap.desktop << EOF
[Desktop Entry]
Name=OWASP ZAP
GenericName=Security Testing Proxy
Comment=Web Application Security Scanner
Exec=/opt/zaproxy/zap.sh
Icon=/opt/zaproxy/zap.ico
Terminal=false
Type=Application
Categories=Development;Security;
EOF

chmod +x ~/.local/share/applications/zap.desktop

# Clean up
rm -f /tmp/ZAP_${ZAP_VERSION}_Linux.tar.gz

echo "OWASP ZAP installed successfully!"
echo "You can launch it by typing 'zap' in the terminal or finding it in applications."
echo "ZAP version: ${ZAP_VERSION}"
