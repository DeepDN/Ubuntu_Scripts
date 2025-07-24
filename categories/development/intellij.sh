#!/bin/bash

# IntelliJ IDEA Installation Script
# This script installs IntelliJ IDEA Community Edition

set -e

echo "Installing IntelliJ IDEA Community Edition..."

# Update package list
sudo apt update

# Install IntelliJ IDEA via Snap
sudo snap install intellij-idea-community --classic

# Alternative: Install via JetBrains Toolbox
# cd /tmp
# wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.27.3.14493.tar.gz
# tar -xzf jetbrains-toolbox-*.tar.gz
# ./jetbrains-toolbox-*/jetbrains-toolbox

echo "IntelliJ IDEA Community Edition installed successfully!"
echo "You can launch it from applications or run 'intellij-idea-community' in terminal"
echo "IntelliJ IDEA is a powerful IDE for Java and other JVM languages"
