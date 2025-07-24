#!/bin/bash

# Jenkins Installation Script
# This script installs Jenkins CI/CD server

set -e

echo "Installing Jenkins..."

# Update package list
sudo apt update

# Install Java (required for Jenkins)
sudo apt install -y openjdk-11-jdk

# Add Jenkins repository key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list
sudo apt update

# Install Jenkins
sudo apt install -y jenkins

# Start and enable Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Configure firewall (if UFW is active)
if sudo ufw status | grep -q "Status: active"; then
    sudo ufw allow 8080
    echo "Firewall rule added for port 8080"
fi

# Wait for Jenkins to start
echo "Waiting for Jenkins to start..."
sleep 30

# Get initial admin password
if [ -f /var/lib/jenkins/secrets/initialAdminPassword ]; then
    echo "Jenkins installed successfully!"
    echo "Access Jenkins at: http://localhost:8080"
    echo "Initial admin password:"
    sudo cat /var/lib/jenkins/secrets/initialAdminPassword
else
    echo "Jenkins installed but initial password file not found."
    echo "Please check Jenkins logs: sudo journalctl -u jenkins"
fi

echo "Jenkins service status:"
sudo systemctl status jenkins --no-pager
