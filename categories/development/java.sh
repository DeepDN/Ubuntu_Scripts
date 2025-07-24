#!/bin/bash

# Java Development Kit Installation Script
# This script installs OpenJDK and development tools

set -e

echo "Installing Java Development Kit..."

# Update package list
sudo apt update

# Install OpenJDK 17 (LTS)
sudo apt install -y openjdk-17-jdk openjdk-17-jre

# Install additional Java tools
sudo apt install -y maven gradle

# Set JAVA_HOME environment variable
echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64' >> ~/.bashrc
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.bashrc

# Install Eclipse IDE
sudo snap install eclipse --classic

# Install IntelliJ IDEA Community Edition
sudo snap install intellij-idea-community --classic

# Verify installation
java -version
javac -version
mvn -version
gradle -version

echo "Java Development Kit installed successfully!"
echo "JAVA_HOME set to: /usr/lib/jvm/java-17-openjdk-amd64"
echo "Installed: OpenJDK 17, Maven, Gradle, Eclipse, IntelliJ IDEA Community"
echo "Please restart your terminal or run 'source ~/.bashrc' to update environment variables"
