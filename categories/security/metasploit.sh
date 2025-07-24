#!/bin/bash

# Metasploit Framework Installation Script
# This script installs Metasploit Framework

set -e

echo "Installing Metasploit Framework..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y curl wget gnupg2 software-properties-common

# Add Rapid7 repository
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
./msfinstall

# Install PostgreSQL for Metasploit database
sudo apt install -y postgresql postgresql-contrib

# Start PostgreSQL service
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Initialize Metasploit database
sudo msfdb init

# Install additional penetration testing tools
sudo apt install -y exploitdb searchsploit

# Update Metasploit
sudo msfupdate

# Clean up
rm -f msfinstall

# Verify installation
msfconsole --version

echo "Metasploit Framework installed successfully!"
echo "Metasploit version: $(msfconsole --version)"
echo "Database initialized and ready to use"
echo "Additional tools installed: exploitdb, searchsploit"
echo "Run 'msfconsole' to start Metasploit"
echo "Run 'searchsploit <term>' to search for exploits"
