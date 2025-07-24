#!/bin/bash

# Demo script to showcase the Ubuntu Application Installer
# This script demonstrates the features without actually installing anything

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

print_color() {
    printf "${1}${2}${NC}\n"
}

clear
print_color $CYAN "=================================================================="
print_color $WHITE "           UBUNTU APPLICATION INSTALLER DEMO"
print_color $CYAN "=================================================================="
echo

print_color $GREEN "This system provides:"
echo
print_color $YELLOW "✓ Interactive menu-driven installation"
print_color $YELLOW "✓ 10 organized categories of applications"
print_color $YELLOW "✓ 100+ applications for developers, testers, and sysadmins"
print_color $YELLOW "✓ Bulk installation options"
print_color $YELLOW "✓ Error handling and recovery"
print_color $YELLOW "✓ Color-coded output for better UX"
echo

print_color $BLUE "Directory structure:"
tree categories/ -L 2

echo
print_color $GREEN "Available categories:"
echo "1. Development Tools (VS Code, Git, Node.js, Python, etc.)"
echo "2. Databases (PostgreSQL, MongoDB, MySQL, Redis, etc.)"
echo "3. DevOps & Cloud (Docker, Kubernetes, Terraform, AWS CLI, etc.)"
echo "4. Testing Tools (Postman, Cypress, Selenium, JMeter, etc.)"
echo "5. System Administration (Nginx, Jenkins, monitoring tools, etc.)"
echo "6. And 5 more categories..."

echo
print_color $PURPLE "To start the installer, run:"
print_color $WHITE "./ubuntu-app-installer.sh"

echo
print_color $CYAN "=================================================================="
