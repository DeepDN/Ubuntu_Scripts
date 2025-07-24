#!/bin/bash

# Iotop Installation Script
# This script installs iotop and related I/O monitoring tools

set -e

echo "Installing I/O monitoring tools..."

# Update package list
sudo apt update

# Install iotop
sudo apt install -y iotop

# Install additional I/O monitoring tools
sudo apt install -y iftop nethogs

# Install system monitoring utilities
sudo apt install -y sysstat

echo "I/O monitoring tools installed successfully!"
echo "Installed tools:"
echo "  - iotop: I/O usage by process"
echo "  - iftop: Network bandwidth usage"
echo "  - nethogs: Network usage by process"
echo "  - sysstat: System performance tools (iostat, vmstat, etc.)"
echo "Usage: sudo iotop, sudo iftop, sudo nethogs"
