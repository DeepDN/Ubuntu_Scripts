#!/bin/bash

# Wazuh All-in-One Installation Script
# This script installs Wazuh Manager, Indexer, and Dashboard on Ubuntu/Linux

set -e

echo "Installing Wazuh All-in-One (Manager + Indexer + Dashboard)..."

# Update system
sudo apt-get update

# Install dependencies
sudo apt-get install -y curl apt-transport-https unzip wget libcap2-bin

# Add Wazuh repository
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | gpg --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/wazuh.gpg --import && sudo chmod 644 /usr/share/keyrings/wazuh.gpg
echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/4.x/apt/ stable main" | sudo tee -a /etc/apt/sources.list.d/wazuh.list

# Update package list
sudo apt-get update

# Install Wazuh Indexer
sudo apt-get install -y wazuh-indexer

# Configure Wazuh Indexer
sudo /usr/share/wazuh-indexer/bin/indexer-security-init.sh

# Enable and start Wazuh Indexer
sudo systemctl daemon-reload
sudo systemctl enable wazuh-indexer
sudo systemctl start wazuh-indexer

# Install Wazuh Manager
sudo apt-get install -y wazuh-manager

# Enable and start Wazuh Manager
sudo systemctl daemon-reload
sudo systemctl enable wazuh-manager
sudo systemctl start wazuh-manager

# Install Wazuh Dashboard
sudo apt-get install -y wazuh-dashboard

# Enable and start Wazuh Dashboard
sudo systemctl daemon-reload
sudo systemctl enable wazuh-dashboard
sudo systemctl start wazuh-dashboard

# Configure firewall (if UFW is active)
if sudo ufw status | grep -q "Status: active"; then
    sudo ufw allow 443/tcp
    sudo ufw allow 1514/tcp
    sudo ufw allow 1515/tcp
    sudo ufw allow 55000/tcp
fi

# Get server IP
SERVER_IP=$(hostname -I | awk '{print $1}')

echo "Wazuh All-in-One installation completed successfully!"
echo ""
echo "Access Information:"
echo "  Dashboard URL: https://$SERVER_IP"
echo "  Default Username: admin"
echo "  Default Password: admin"
echo ""
echo "Service Status:"
echo "  Wazuh Manager: $(sudo systemctl is-active wazuh-manager)"
echo "  Wazuh Indexer: $(sudo systemctl is-active wazuh-indexer)"
echo "  Wazuh Dashboard: $(sudo systemctl is-active wazuh-dashboard)"
echo ""
echo "Important: Change default credentials after first login!"
echo "Documentation: https://documentation.wazuh.com/"
