#!/bin/bash

# Tcpdump Installation Script
# This script installs tcpdump and network analysis tools

set -e

echo "Installing network analysis tools..."

# Update package list
sudo apt update

# Install tcpdump
sudo apt install -y tcpdump

# Install additional network tools
sudo apt install -y ngrep netcat-openbsd traceroute

# Install network utilities
sudo apt install -y net-tools dnsutils

echo "Network analysis tools installed successfully!"
echo "Installed tools:"
echo "  - tcpdump: Network packet analyzer"
echo "  - ngrep: Network grep"
echo "  - netcat: Network utility"
echo "  - traceroute: Network path tracing"
echo "  - net-tools: Network configuration tools"
echo "  - dnsutils: DNS lookup utilities"
echo "Usage: sudo tcpdump -i any, ngrep, nc, traceroute"
