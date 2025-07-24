#!/bin/bash

# Ansible Installation Script
# This script installs Ansible automation platform

set -e

echo "Installing Ansible..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y software-properties-common

# Add Ansible PPA
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install Ansible
sudo apt install -y ansible

# Install additional Ansible tools
pip3 install --user ansible-lint
pip3 install --user molecule

# Install Ansible collections
ansible-galaxy collection install community.general
ansible-galaxy collection install ansible.posix

# Verify installation
ansible --version

echo "Ansible installed successfully!"
echo "Ansible version: $(ansible --version | head -n 1)"
echo "Configuration file: /etc/ansible/ansible.cfg"
echo "Inventory file: /etc/ansible/hosts"
echo "Additional tools installed: ansible-lint, molecule"
