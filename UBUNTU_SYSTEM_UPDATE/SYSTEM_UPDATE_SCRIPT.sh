#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Upgrade all packages
echo "Upgrading all packages..."
sudo apt-get upgrade -y

# Upgrade distribution (optional, can be commented out if not needed)
echo "Upgrading distribution..."
sudo apt-get dist-upgrade -y

# Configure any partially installed packages
echo "Configuring partially installed packages..."
sudo dpkg --configure -a

# Fix broken packages
echo "Fixing broken packages..."
sudo apt-get install -f

# Remove unused packages
echo "Removing unused packages..."
sudo apt-get autoremove -y

# Clean up unnecessary files
echo "Cleaning up unnecessary files..."
sudo apt-get autoclean

# Remove any leftover dependencies
echo "Removing leftover dependencies..."
sudo apt-get remove --purge -y $(dpkg -l | awk '/^rc/ { print $2 }')

# Final cleanup
echo "Performing final cleanup..."
sudo apt-get clean

echo "Congratualation, Your System maintenance complete!, Deepak Nemade"