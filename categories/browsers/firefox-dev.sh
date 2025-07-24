#!/bin/bash

# Firefox Developer Edition Installation Script
# This script installs Firefox Developer Edition

set -e

echo "Installing Firefox Developer Edition..."

# Create directory for Firefox Developer Edition
sudo mkdir -p /opt/firefox-dev

# Download Firefox Developer Edition
cd /tmp
wget -O firefox-dev.tar.bz2 "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"

# Extract Firefox Developer Edition
sudo tar -xjf firefox-dev.tar.bz2 -C /opt/firefox-dev --strip-components=1

# Create symbolic link
sudo ln -sf /opt/firefox-dev/firefox /usr/local/bin/firefox-dev

# Create desktop entry
cat > ~/.local/share/applications/firefox-dev.desktop << EOF
[Desktop Entry]
Name=Firefox Developer Edition
GenericName=Web Browser
Comment=Browse the Web with Firefox Developer Edition
Exec=/opt/firefox-dev/firefox %u
Icon=/opt/firefox-dev/browser/chrome/icons/default/default128.png
Terminal=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Categories=Network;WebBrowser;
Keywords=web;browser;internet;
EOF

# Make desktop entry executable
chmod +x ~/.local/share/applications/firefox-dev.desktop

# Clean up
rm -f /tmp/firefox-dev.tar.bz2

echo "Firefox Developer Edition installed successfully!"
echo "You can launch it by typing 'firefox-dev' in the terminal or finding it in applications."
