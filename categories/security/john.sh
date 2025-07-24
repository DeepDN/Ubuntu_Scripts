#!/bin/bash

# John the Ripper Installation Script
# This script installs John the Ripper password cracker

set -e

echo "Installing John the Ripper..."

# Update package list
sudo apt update

# Install John the Ripper
sudo apt install -y john

# Install additional password tools
sudo apt install -y hashcat hydra

# Install wordlists
sudo apt install -y wordlists

# Install additional cracking tools
sudo apt install -y crunch

echo "John the Ripper installed successfully!"
echo "John version: $(john --version)"
echo "Additional tools installed:"
echo "  - hashcat: Advanced password recovery"
echo "  - hydra: Network login cracker"
echo "  - crunch: Wordlist generator"
echo "  - wordlists: Common password lists"
echo "Usage: john <hash_file>"
echo "Wordlists location: /usr/share/wordlists/"
