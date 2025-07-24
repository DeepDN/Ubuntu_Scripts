#!/bin/bash

# LibreOffice Installation Script
# This script installs LibreOffice office suite

set -e

echo "Installing LibreOffice..."

# Update package list
sudo apt update

# Install LibreOffice
sudo apt install -y libreoffice

# Install additional language packs (optional)
sudo apt install -y libreoffice-l10n-en-us

# Install additional templates and clipart
sudo apt install -y libreoffice-templates libreoffice-clipart

# Install LibreOffice help
sudo apt install -y libreoffice-help-en-us

echo "LibreOffice installed successfully!"
echo "Applications installed:"
echo "  - LibreOffice Writer (word processor)"
echo "  - LibreOffice Calc (spreadsheet)"
echo "  - LibreOffice Impress (presentations)"
echo "  - LibreOffice Draw (graphics)"
echo "  - LibreOffice Base (database)"
echo "  - LibreOffice Math (formula editor)"
