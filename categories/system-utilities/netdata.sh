#!/bin/bash

# Netdata Installation Script
# This script installs Netdata real-time performance monitoring

set -e

echo "Installing Netdata..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y curl

# Download and install Netdata
bash <(curl -Ss https://my-netdata.io/kickstart.sh) --stable-channel --disable-telemetry

# Configure firewall (if UFW is active)
if sudo ufw status | grep -q "Status: active"; then
    sudo ufw allow 19999
    echo "Firewall rule added for port 19999"
fi

# Start and enable Netdata service
sudo systemctl start netdata
sudo systemctl enable netdata

# Wait for Netdata to start
sleep 10

# Check if Netdata is running
if systemctl is-active --quiet netdata; then
    echo "Netdata installed and started successfully!"
    echo "Access Netdata dashboard at: http://localhost:19999"
    echo "Service status:"
    sudo systemctl status netdata --no-pager -l
else
    echo "Netdata installation completed but service may not be running"
    echo "Check logs with: sudo journalctl -u netdata"
fi

echo "Netdata provides real-time system monitoring with web interface"
echo "Default port: 19999"
echo "Configuration file: /etc/netdata/netdata.conf"
