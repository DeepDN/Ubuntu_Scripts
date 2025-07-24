#!/bin/bash

# Android Studio Installation Script
# This script installs Android Studio IDE

set -e

echo "Installing Android Studio..."

# Update package list
sudo apt update

# Install Java (required for Android Studio)
sudo apt install -y openjdk-11-jdk

# Install Android Studio via Snap
sudo snap install android-studio --classic

# Alternative: Manual installation
# cd /tmp
# wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.1.1.28/android-studio-2023.1.1.28-linux.tar.gz
# sudo tar -xzf android-studio-*.tar.gz -C /opt/
# sudo ln -sf /opt/android-studio/bin/studio.sh /usr/local/bin/android-studio

# Install additional dependencies for Android development
sudo apt install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

echo "Android Studio installed successfully!"
echo "You can launch it from applications or run 'android-studio' in terminal"
echo "First launch will download Android SDK and additional components"
echo "Make sure to configure Android SDK path in Android Studio settings"
