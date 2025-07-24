#!/bin/bash

# Apache JMeter Installation Script
# This script installs Apache JMeter for load testing

set -e

echo "Installing Apache JMeter..."

# Update package list
sudo apt update

# Install Java (required for JMeter)
sudo apt install -y openjdk-11-jdk

# Get the latest JMeter version
JMETER_VERSION=$(curl -s https://api.github.com/repos/apache/jmeter/releases/latest | grep -oP '"tag_name": "v\K(.*)(?=")')

# Download JMeter
cd /tmp
wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

# Extract JMeter
sudo tar -xzf apache-jmeter-${JMETER_VERSION}.tgz -C /opt/
sudo mv /opt/apache-jmeter-${JMETER_VERSION} /opt/jmeter

# Create symbolic links
sudo ln -sf /opt/jmeter/bin/jmeter /usr/local/bin/jmeter
sudo ln -sf /opt/jmeter/bin/jmeter-server /usr/local/bin/jmeter-server

# Set JMETER_HOME environment variable
echo 'export JMETER_HOME=/opt/jmeter' >> ~/.bashrc
echo 'export PATH=$PATH:$JMETER_HOME/bin' >> ~/.bashrc

# Create desktop entry
cat > ~/.local/share/applications/jmeter.desktop << EOF
[Desktop Entry]
Name=Apache JMeter
GenericName=Load Testing Tool
Comment=Load Testing and Performance Measurement
Exec=/opt/jmeter/bin/jmeter
Icon=/opt/jmeter/docs/images/jmeter.png
Terminal=false
Type=Application
Categories=Development;Testing;
EOF

chmod +x ~/.local/share/applications/jmeter.desktop

# Install JMeter plugins manager
cd /opt/jmeter/lib/ext
sudo wget https://jmeter-plugins.org/get/

# Clean up
rm -f /tmp/apache-jmeter-${JMETER_VERSION}.tgz

echo "Apache JMeter installed successfully!"
echo "JMeter version: ${JMETER_VERSION}"
echo "You can launch it by typing 'jmeter' in the terminal or finding it in applications"
echo "JMETER_HOME set to: /opt/jmeter"
echo "Please restart your terminal or run 'source ~/.bashrc' to update environment variables"
