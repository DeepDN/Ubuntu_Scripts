#!/bin/bash

# Glances Installation Script
# This script installs Glances system monitoring tool

set -e

echo "Installing Glances..."

# Update package list
sudo apt update

# Install Python pip if not present
sudo apt install -y python3-pip

# Install Glances via pip for latest version
pip3 install --user glances[all]

# Install additional dependencies for full functionality
sudo apt install -y lm-sensors

# Install optional dependencies
pip3 install --user psutil bottle batinfo

# Add ~/.local/bin to PATH if not already there
if ! echo $PATH | grep -q "$HOME/.local/bin"; then
    echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc
fi

# Create systemd service for Glances web server (optional)
cat > ~/.config/systemd/user/glances.service << EOF
[Unit]
Description=Glances
After=network.target

[Service]
ExecStart=$HOME/.local/bin/glances -w
Restart=on-abort

[Install]
WantedBy=default.target
EOF

# Enable user systemd directory
systemctl --user daemon-reload

# Verify installation
~/.local/bin/glances --version

echo "Glances installed successfully!"
echo "Glances version: $(~/.local/bin/glances --version)"
echo "Usage:"
echo "  - Run 'glances' for terminal interface"
echo "  - Run 'glances -w' for web interface (http://localhost:61208)"
echo "  - Run 'glances -s' for server mode"
echo "To enable web server on boot: systemctl --user enable glances"
echo "Please restart your terminal or run 'source ~/.bashrc' to update PATH"
