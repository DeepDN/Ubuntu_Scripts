#!/bin/bash

# Flutter Installation Script
# This script installs Flutter SDK for mobile app development

set -e

echo "Installing Flutter..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y curl git unzip xz-utils zip libglu1-mesa

# Install Flutter via Snap (recommended)
sudo snap install flutter --classic

# Alternative manual installation
# cd /opt
# sudo git clone https://github.com/flutter/flutter.git -b stable
# echo 'export PATH="$PATH:/opt/flutter/bin"' >> ~/.bashrc

# Install Android SDK dependencies
sudo apt install -y openjdk-11-jdk

# Accept Android licenses (if Android SDK is installed)
if command -v flutter &> /dev/null; then
    flutter doctor --android-licenses || true
fi

# Run Flutter doctor
flutter doctor

echo "Flutter installed successfully!"
echo "Flutter version: $(flutter --version | head -n 1)"
echo "Run 'flutter doctor' to check for any missing dependencies"
echo "To create a new app: flutter create my_app"
