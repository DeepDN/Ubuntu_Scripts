#!/bin/bash

# Ubuntu Application Installer v3.0
# Professional automation script for installing development tools and applications
# Author: Deepak Nemade (DN)
# Updated: November 2025

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# Function to print colored output
print_color() {
    printf "${1}${2}${NC}\n"
}

# Function to print professional header
print_header() {
    clear
    print_color $CYAN "=================================================================="
    print_color $WHITE "           UBUNTU APPLICATION INSTALLER v3.0"
    print_color $CYAN "=================================================================="
    print_color $YELLOW "  Professional automation for developers, DevOps engineers,"
    print_color $YELLOW "  system administrators, and security professionals"
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

# Function to check if running as root
check_root() {
    if [[ $EUID -eq 0 ]]; then
        print_color $RED "This script should not be run as root for security reasons."
        print_color $YELLOW "Please run as a regular user. Sudo will be used when needed."
        exit 1
    fi
}

# Function to update system
update_system() {
    print_color $BLUE "Updating system packages..."
    sudo apt-get update && sudo apt-get upgrade -y
    print_color $GREEN "System updated successfully!"
}

# Function to show main menu
show_main_menu() {
    print_header
    print_color $WHITE "Select Application Category:"
    echo
    print_color $GREEN "1.  Development Tools (Git, Node.js, Python, Docker, etc.)"
    print_color $GREEN "2.  Databases (PostgreSQL, MySQL, MongoDB, Redis)"
    print_color $GREEN "3.  DevOps & Cloud Tools (Docker, Kubernetes, Terraform, AWS)"
    print_color $GREEN "4.  Testing Tools (Postman, Cypress, JMeter, Selenium)"
    print_color $GREEN "5.  System Administration (Nginx, Apache, Monitoring)"
    print_color $GREEN "6.  Security Tools (Nmap, Wireshark, Burp Suite, OWASP ZAP)"
    print_color $GREEN "7.  Productivity Apps (Slack, Discord, Teams, Browsers)"
    print_color $GREEN "8.  Multimedia (VLC, OBS, GIMP, Audacity)"
    echo
    print_color $YELLOW "Quick Install Options:"
    print_color $YELLOW "9.  Essential Development Stack (Git, Node.js, Docker, VS Code)"
    print_color $YELLOW "10. DevOps Professional Stack (Docker, K8s, Terraform, AWS CLI)"
    print_color $YELLOW "11. Security Testing Stack (Nmap, Burp, OWASP ZAP, Wireshark)"
    print_color $YELLOW "12. Full Stack Developer Setup (All development tools)"
    echo
    print_color $CYAN "13. System Update & Essential Tools"
    print_color $CYAN "14. Show Available Applications"
    echo
    print_color $PURPLE "0.  Exit"
    echo
}

# Function to install application
install_application() {
    local category=$1
    local app_name=$2
    local script_path="categories/${category}/${app_name}.sh"
    
    if [[ -f "$script_path" ]]; then
        print_color $BLUE "Installing $app_name..."
        chmod +x "$script_path"
        if bash "$script_path"; then
            print_color $GREEN "$app_name installed successfully!"
        else
            print_color $RED "Failed to install $app_name"
            return 1
        fi
    else
        print_color $RED "Installation script not found: $script_path"
        return 1
    fi
    
    echo
    read -p "Press Enter to continue..."
}

# Function to install essential development stack
install_essential_dev() {
    print_color $BLUE "Installing Essential Development Stack..."
    
    local apps=("git" "nvm" "docker" "vscode" "python")
    local categories=("development" "development" "devops" "development" "development")
    
    for i in "${!apps[@]}"; do
        install_application "${categories[$i]}" "${apps[$i]}"
    done
    
    print_color $GREEN "Essential Development Stack installation completed!"
}

# Function to install DevOps professional stack
install_devops_stack() {
    print_color $BLUE "Installing DevOps Professional Stack..."
    
    local apps=("docker" "kubernetes" "terraform" "ansible" "aws-cli" "jenkins")
    
    for app in "${apps[@]}"; do
        install_application "devops" "$app"
    done
    
    print_color $GREEN "DevOps Professional Stack installation completed!"
}

# Function to install security testing stack
install_security_stack() {
    print_color $BLUE "Installing Security Testing Stack..."
    
    local apps=("nmap" "wireshark" "burpsuite" "owasp-zap" "metasploit" "john" "wazuh" "usb-blocker")
    
    for app in "${apps[@]}"; do
        install_application "security" "$app"
    done
    
    print_color $GREEN "Security Testing Stack installation completed!"
}

# Function to show available applications
show_available_apps() {
    print_header
    print_color $WHITE "Available Applications by Category:"
    echo
    
    for category in categories/*/; do
        if [[ -d "$category" ]]; then
            category_name=$(basename "$category")
            print_color $CYAN "$(echo $category_name | tr '-' ' ' | tr '[:lower:]' '[:upper:]'):"
            
            for script in "$category"*.sh; do
                if [[ -f "$script" ]]; then
                    app_name=$(basename "$script" .sh)
                    print_color $GREEN "  • $app_name"
                fi
            done
            echo
        fi
    done
    
    read -p "Press Enter to continue..."
}

# Main function
main() {
    check_root
    
    while true; do
        show_main_menu
        read -p "Enter your choice [0-14]: " choice
        
        case $choice in
            1) show_development_menu ;;
            2) show_database_menu ;;
            3) show_devops_menu ;;
            4) show_testing_menu ;;
            5) show_sysadmin_menu ;;
            6) show_security_menu ;;
            7) show_productivity_menu ;;
            8) show_multimedia_menu ;;
            9) install_essential_dev ;;
            10) install_devops_stack ;;
            11) install_security_stack ;;
            12) install_full_stack ;;
            13) update_system ;;
            14) show_available_apps ;;
            0)
                print_color $GREEN "Thank you for using Ubuntu Application Installer!"
                print_color $YELLOW "Created by Deepak Nemade (DN)"
                exit 0
                ;;
            *)
                print_color $RED "Invalid option! Please try again."
                sleep 2
                ;;
        esac
    done
}

# Function to show security menu
show_security_menu() {
    while true; do
        print_header
        print_color $WHITE "Security & Penetration Testing Tools:"
        echo
        print_color $GREEN "1.  Nmap (Network Scanner)"
        print_color $GREEN "2.  Wireshark (Network Protocol Analyzer)"
        print_color $GREEN "3.  Burp Suite (Web Security Testing)"
        print_color $GREEN "4.  OWASP ZAP (Web Application Security)"
        print_color $GREEN "5.  Metasploit (Penetration Testing Framework)"
        print_color $GREEN "6.  John the Ripper (Password Cracker)"
        print_color $GREEN "7.  SQLMap (SQL Injection Tool)"
        print_color $GREEN "8.  Nikto (Web Server Scanner)"
        print_color $GREEN "9.  Wazuh (SIEM & Security Monitoring)"
        print_color $GREEN "10. USB Blocker (USB Port Security)"
        echo
        print_color $PURPLE "0.  Back to main menu"
        echo
        
        read -p "Enter your choice [0-10]: " sec_choice
        case $sec_choice in
            1) install_application "security" "nmap" ;;
            2) install_application "security" "wireshark" ;;
            3) install_application "security" "burpsuite" ;;
            4) install_application "security" "owasp-zap" ;;
            5) install_application "security" "metasploit" ;;
            6) install_application "security" "john" ;;
            7) install_application "security" "sqlmap" ;;
            8) install_application "security" "nikto" ;;
            9) install_application "security" "wazuh" ;;
            10) install_application "security" "usb-blocker" ;;
            0) break ;;
            *) print_color $RED "Invalid option!" ;;
        esac
    done
}

# Placeholder functions for other menus
show_development_menu() { print_color $RED "Development menu - Coming soon"; read -p "Press Enter..."; }
show_database_menu() { print_color $RED "Database menu - Coming soon"; read -p "Press Enter..."; }
show_devops_menu() { print_color $RED "DevOps menu - Coming soon"; read -p "Press Enter..."; }
show_testing_menu() { print_color $RED "Testing menu - Coming soon"; read -p "Press Enter..."; }
show_sysadmin_menu() { print_color $RED "System Admin menu - Coming soon"; read -p "Press Enter..."; }
show_productivity_menu() { print_color $RED "Productivity menu - Coming soon"; read -p "Press Enter..."; }
show_multimedia_menu() { print_color $RED "Multimedia menu - Coming soon"; read -p "Press Enter..."; }
install_full_stack() { print_color $RED "Full stack installation - Coming soon"; read -p "Press Enter..."; }

# Run main function
main "$@"
