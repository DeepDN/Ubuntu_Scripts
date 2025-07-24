#!/bin/bash

# Postman Installation Script
# This script installs Postman API testing tool

set -e

echo "Installing Postman..."

# Create directory for Postman
sudo mkdir -p /opt/postman

# Download Postman
cd /tmp
wget https://dl.pstmn.io/download/latest/linux64 -O postman-linux-x64.tar.gz

# Extract Postman
sudo tar -xzf postman-linux-x64.tar.gz -C /opt/postman --strip-components=1

# Create symbolic link
sudo ln -sf /opt/postman/Postman /usr/local/bin/postman

# Create desktop entry
cat > ~/.local/share/applications/postman.desktop << EOF
[Desktop Entry]
Name=Postman
GenericName=API Client
Comment=Test and develop APIs
Exec=/opt/postman/Postman
Icon=/opt/postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOF

# Make desktop entry executable
chmod +x ~/.local/share/applications/postman.desktop

# Install Newman (Postman CLI)
if command -v npm &> /dev/null; then
    sudo npm install -g newman
    sudo npm install -g newman-reporter-html
    echo "Newman CLI installed successfully!"
fi

# Clean up
rm -f /tmp/postman-linux-x64.tar.gz

echo "Postman installed successfully!"
echo "You can launch it by typing 'postman' in the terminal or finding it in applications."
