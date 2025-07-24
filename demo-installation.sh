#!/bin/bash

# Demo Installation Script
# This script demonstrates the installation system without actually installing

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

print_color() {
    printf "${1}${2}${NC}\n"
}

print_header() {
    clear
    print_color $CYAN "=================================================================="
    print_color $WHITE "           INSTALLATION DEMO"
    print_color $CYAN "=================================================================="
    print_color $YELLOW "  Demonstrating Ubuntu Application Installer v2.0"
    print_color $CYAN "=================================================================="
    echo
    print_color $RED "██████╗ ███╗   ██╗"
    print_color $RED "██╔══██╗████╗  ██║"
    print_color $RED "██║  ██║██╔██╗ ██║"
    print_color $RED "██║  ██║██║╚██╗██║"
    print_color $RED "██████╔╝██║ ╚████║"
    print_color $RED "╚═════╝ ╚═╝  ╚═══╝"
    echo
    print_color $BLUE "    Created by: Deepak Nemade (DN)"
    print_color $BLUE "    Professional System Administrator & DevOps Engineer"
    echo
}

simulate_installation() {
    local app_name="$1"
    local category="$2"
    
    print_color $YELLOW "🚀 Installing $app_name..."
    sleep 1
    print_color $GREEN "✅ Updating package lists..."
    sleep 0.5
    print_color $GREEN "✅ Installing dependencies..."
    sleep 0.5
    print_color $GREEN "✅ Adding repository keys..."
    sleep 0.5
    print_color $GREEN "✅ Installing $app_name..."
    sleep 1
    print_color $GREEN "✅ Configuring $app_name..."
    sleep 0.5
    print_color $CYAN "🎉 $app_name installed successfully!"
    echo
}

main() {
    print_header
    
    print_color $WHITE "This demo shows how the installation system works:"
    echo
    
    print_color $CYAN "📋 Available Categories:"
    print_color $WHITE "1. Development Tools (16 apps)"
    print_color $WHITE "2. Databases (7 apps)"
    print_color $WHITE "3. DevOps & Cloud Tools (9 apps)"
    print_color $WHITE "4. Testing Tools (6 apps)"
    print_color $WHITE "5. Security & Hacking Tools (8 apps)"
    print_color $WHITE "6. System Administration (5 apps)"
    print_color $WHITE "7. Productivity Applications (10 apps)"
    print_color $WHITE "8. Multimedia Applications (8 apps)"
    print_color $WHITE "9. Web Browsers (7 apps)"
    print_color $WHITE "10. System Utilities & Monitoring (8 apps)"
    echo
    
    print_color $YELLOW "🎯 Demo: Installing Development Tools..."
    echo
    
    # Simulate installing some development tools
    simulate_installation "Visual Studio Code" "Development"
    simulate_installation "Git & GitHub CLI" "Development"
    simulate_installation "Node.js & NPM" "Development"
    simulate_installation "Docker" "DevOps"
    simulate_installation "PostgreSQL" "Database"
    
    print_color $CYAN "=================================================================="
    print_color $WHITE "           DEMO COMPLETED"
    print_color $CYAN "=================================================================="
    echo
    print_color $GREEN "✅ All applications would be installed successfully!"
    print_color $BLUE "📊 Total: 84 applications available across 10 categories"
    print_color $YELLOW "🚀 Ready for production use!"
    echo
    print_color $WHITE "To run the actual installer:"
    print_color $CYAN "./ubuntu-app-installer.sh"
    echo
    print_color $WHITE "To see all available applications:"
    print_color $CYAN "./show-available-apps.sh"
    echo
}

main
