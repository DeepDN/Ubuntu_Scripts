#!/bin/bash

# Ubuntu Application Installer
# Comprehensive automation script for installing various applications
# Author: Ubuntu Scripts Repository
# Version: 2.0

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

# Function to print colored output
print_color() {
    printf "${1}${2}${NC}\n"
}

# Function to print header with DN branding
print_header() {
    clear
    print_color $CYAN "=================================================================="
    print_color $WHITE "           UBUNTU APPLICATION INSTALLER v2.0"
    print_color $CYAN "=================================================================="
    print_color $YELLOW "  Automated installation scripts for developers, testers,"
    print_color $YELLOW "  system administrators, and DevOps professionals"
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
    sudo apt update && sudo apt upgrade -y
    print_color $GREEN "System updated successfully!"
}

# Function to show category menu
show_category_menu() {
    print_header
    print_color $WHITE "Select Application Category:"
    echo
    print_color $GREEN "1.  Development Tools"
    print_color $GREEN "2.  Databases"
    print_color $GREEN "3.  DevOps & Cloud Tools"
    print_color $GREEN "4.  Testing Tools"
    print_color $GREEN "5.  System Administration"
    print_color $GREEN "6.  Productivity Applications"
    print_color $GREEN "7.  Security & Hacking Tools"
    print_color $GREEN "8.  Multimedia Applications"
    print_color $GREEN "9.  Web Browsers"
    print_color $GREEN "10. System Utilities & Monitoring"
    echo
    print_color $YELLOW "11. Install All Essential Development Tools"
    print_color $YELLOW "12. Install All DevOps Tools"
    print_color $YELLOW "13. Install All Testing Tools"
    print_color $YELLOW "14. Install All Security Tools"
    print_color $YELLOW "15. Install All Monitoring Tools"
    echo
    print_color $CYAN "Multiple Selection Mode:"
    print_color $CYAN "16. Select Multiple Categories (e.g., 1,3,7)"
    echo
    print_color $PURPLE "0.  Exit"
    echo
}

# Function to show development tools
show_development_menu() {
    print_header
    print_color $WHITE "Development Tools:"
    echo
    print_color $GREEN "1.  Visual Studio Code"
    print_color $GREEN "2.  Git & GitHub CLI"
    print_color $GREEN "3.  Node.js & NPM"
    print_color $GREEN "4.  Python & Pip"
    print_color $GREEN "5.  Java Development Kit (OpenJDK)"
    print_color $GREEN "6.  Go Programming Language"
    print_color $GREEN "7.  Rust Programming Language"
    print_color $GREEN "8.  PHP & Composer"
    print_color $GREEN "9.  Ruby & Rails"
    print_color $GREEN "10. Vim/Neovim"
    print_color $GREEN "11. Sublime Text"
    print_color $GREEN "12. Atom Editor (Deprecated)"
    print_color $GREEN "13. Android Studio"
    print_color $GREEN "14. Flutter SDK"
    print_color $GREEN "15. Warp Terminal"
    echo
    print_color $PURPLE "0.  Back to main menu"
    echo
}

# Function to show database menu
show_database_menu() {
    print_header
    print_color $WHITE "Database Tools:"
    echo
    print_color $GREEN "1.  PostgreSQL & pgAdmin"
    print_color $GREEN "2.  MySQL & MySQL Workbench"
    print_color $GREEN "3.  MongoDB & MongoDB Compass"
    print_color $GREEN "4.  Redis"
    print_color $GREEN "5.  SQLite & SQLite Browser"
    print_color $GREEN "6.  DBeaver (Universal Database Tool)"
    echo
    print_color $PURPLE "0.  Back to main menu"
    echo
}

# Function to show DevOps menu
show_devops_menu() {
    print_header
    print_color $WHITE "DevOps & Cloud Tools:"
    echo
    print_color $GREEN "1.  Docker & Docker Compose"
    print_color $GREEN "2.  Kubernetes (kubectl, minikube)"
    print_color $GREEN "3.  Terraform"
    print_color $GREEN "4.  Ansible"
    print_color $GREEN "5.  Jenkins"
    print_color $GREEN "6.  AWS CLI"
    echo
    print_color $PURPLE "0.  Back to main menu"
    echo
}

# Function to show testing menu
show_testing_menu() {
    print_header
    print_color $WHITE "Testing Tools:"
    echo
    print_color $GREEN "1.  Postman (API Testing)"
    print_color $GREEN "2.  Cypress (E2E Testing)"
    print_color $GREEN "3.  Selenium WebDriver"
    print_color $GREEN "4.  JMeter (Load Testing)"
    print_color $GREEN "5.  Newman (Postman CLI)"
    print_color $GREEN "6.  Artillery (Load Testing)"
    print_color $GREEN "7.  K6 (Load Testing)"
    print_color $GREEN "8.  Playwright (Browser Testing)"
    print_color $GREEN "9.  Insomnia (API Client)"
    print_color $GREEN "10. REST Client Tools"
    echo
    print_color $PURPLE "0.  Back to main menu"
    echo
}

# Function to show monitoring menu
show_monitoring_menu() {
    print_header
    print_color $WHITE "System Monitoring & Utilities:"
    echo
    print_color $GREEN "1.  Htop (Interactive Process Viewer)"
    print_color $GREEN "2.  Glances (System Monitoring)"
    print_color $GREEN "3.  Netdata (Real-time Performance Monitoring)"
    print_color $GREEN "4.  Prometheus & Grafana"
    print_color $GREEN "5.  Zabbix Agent"
    print_color $GREEN "6.  Nagios Core"
    print_color $GREEN "7.  Collectd (System Statistics)"
    print_color $GREEN "8.  Monit (Process Monitoring)"
    print_color $GREEN "9.  Fail2ban (Intrusion Prevention)"
    print_color $GREEN "10. Logwatch (Log Analysis)"
    print_color $GREEN "11. Neofetch (System Information)"
    print_color $GREEN "12. Bashtop (Resource Monitor)"
    print_color $GREEN "13. Iotop (I/O Monitoring)"
    print_color $GREEN "14. Nethogs (Network Bandwidth Monitor)"
    print_color $GREEN "15. Tcpdump (Network Packet Analyzer)"
    echo
    print_color $PURPLE "0.  Back to main menu"
    echo
}

# Function to show browser menu
show_browser_menu() {
    print_header
    print_color $WHITE "Web Browsers:"
    echo
    print_color $GREEN "1.  Google Chrome"
    print_color $GREEN "2.  Firefox Developer Edition"
    print_color $GREEN "3.  Brave Browser"
    print_color $GREEN "4.  Opera Browser"
    print_color $GREEN "5.  Microsoft Edge"
    print_color $GREEN "6.  Vivaldi Browser"
    print_color $GREEN "7.  Tor Browser"
    echo
    print_color $PURPLE "0.  Back to main menu"
    echo
}

# Function to show productivity menu
show_productivity_menu() {
    print_header
    print_color $WHITE "Productivity Applications:"
    echo
    print_color $GREEN "1.  Slack"
    print_color $GREEN "2.  Discord"
    print_color $GREEN "3.  Microsoft Teams"
    print_color $GREEN "4.  Zoom"
    print_color $GREEN "5.  Notion"
    print_color $GREEN "6.  Obsidian"
    print_color $GREEN "7.  Keybase"
    echo
    print_color $PURPLE "0.  Back to main menu"
    echo
}

# Function to show multimedia menu
show_multimedia_menu() {
    print_header
    print_color $WHITE "Multimedia Applications:"
    echo
    print_color $GREEN "1.  VLC Media Player"
    print_color $GREEN "2.  OBS Studio"
    print_color $GREEN "3.  GIMP"
    print_color $GREEN "4.  Audacity"
    echo
    print_color $PURPLE "0.  Back to main menu"
    echo
}

# Function to show system admin menu
show_sysadmin_menu() {
    print_header
    print_color $WHITE "System Administration Tools:"
    echo
    print_color $GREEN "1.  Nginx"
    print_color $GREEN "2.  Apache2"
    print_color $GREEN "3.  Fail2ban"
    echo
    print_color $PURPLE "0.  Back to main menu"
    echo
}

# Function to show system admin menu
show_sysadmin_menu() {
    print_header
    print_color $WHITE "System Administration Tools:"
    echo
    print_color $GREEN "1.  Nginx"
    print_color $GREEN "2.  Apache2"
    print_color $GREEN "3.  Fail2ban"
    print_color $GREEN "4.  UFW Firewall"
    print_color $GREEN "5.  Htop & System Monitoring"
    print_color $GREEN "6.  Netdata"
    print_color $GREEN "7.  Zabbix Agent"
    print_color $GREEN "8.  OpenSSH Server"
    print_color $GREEN "9.  Certbot (Let's Encrypt)"
    print_color $GREEN "10. Logrotate"
    echo
    print_color $PURPLE "0.  Back to main menu"
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
        bash "$script_path"
        if [[ $? -eq 0 ]]; then
            print_color $GREEN "$app_name installed successfully!"
        else
            print_color $RED "Failed to install $app_name"
        fi
    else
        print_color $RED "Installation script not found: $script_path"
    fi
    
    echo
    read -p "Press Enter to continue..."
}

# Function to install bulk applications
install_bulk() {
    local category=$1
    print_color $BLUE "Installing all $category applications..."
    
    for script in categories/${category}/*.sh; do
        if [[ -f "$script" ]]; then
            app_name=$(basename "$script" .sh)
            print_color $YELLOW "Installing $app_name..."
            chmod +x "$script"
            bash "$script"
        fi
    done
    
    print_color $GREEN "Bulk installation completed!"
    echo
    read -p "Press Enter to continue..."
}

# Function to handle multiple category selection
handle_multiple_selection() {
    print_header
    print_color $WHITE "Multiple Category Selection:"
    print_color $YELLOW "Enter category numbers separated by commas (e.g., 1,3,7,10):"
    echo
    print_color $GREEN "1=Development, 2=Databases, 3=DevOps, 4=Testing, 5=SysAdmin"
    print_color $GREEN "6=Productivity, 7=Security, 8=Multimedia, 9=Browsers, 10=Monitoring"
    echo
    read -p "Enter your selection: " selection
    
    IFS=',' read -ra CATEGORIES <<< "$selection"
    
    for category in "${CATEGORIES[@]}"; do
        category=$(echo "$category" | xargs) # trim whitespace
        case $category in
            1) install_bulk "development" ;;
            2) install_bulk "databases" ;;
            3) install_bulk "devops" ;;
            4) install_bulk "testing" ;;
            5) install_bulk "system-admin" ;;
            6) install_bulk "productivity" ;;
            7) install_bulk "security" ;;
            8) install_bulk "multimedia" ;;
            9) install_bulk "browsers" ;;
            10) install_bulk "system-utilities" ;;
            *) print_color $RED "Invalid category: $category" ;;
        esac
    done
}

# Main function
main() {
    check_root
    
    while true; do
        show_category_menu
        read -p "Enter your choice [0-16]: " choice
        
        case $choice in
            1)
                while true; do
                    show_development_menu
                    read -p "Enter your choice [0-15]: " dev_choice
                    case $dev_choice in
                        1) install_application "development" "vscode" ;;
                        2) install_application "development" "git" ;;
                        3) install_application "development" "nodejs" ;;
                        4) install_application "development" "python" ;;
                        5) install_application "development" "java" ;;
                        6) install_application "development" "golang" ;;
                        7) install_application "development" "rust" ;;
                        8) install_application "development" "php" ;;
                        9) install_application "development" "ruby" ;;
                        10) install_application "development" "vim" ;;
                        11) install_application "development" "sublime" ;;
                        12) install_application "development" "atom" ;;
                        13) install_application "development" "android-studio" ;;
                        14) install_application "development" "flutter" ;;
                        15) install_application "development" "warp" ;;
                        0) break ;;
                        *) print_color $RED "Invalid option!" ;;
                    esac
                done
                ;;
            2)
                while true; do
                    show_database_menu
                    read -p "Enter your choice [0-6]: " db_choice
                    case $db_choice in
                        1) install_application "databases" "postgresql" ;;
                        2) install_application "databases" "mysql" ;;
                        3) install_application "databases" "mongodb" ;;
                        4) install_application "databases" "redis" ;;
                        5) install_application "databases" "sqlite" ;;
                        6) install_application "databases" "dbeaver" ;;
                        0) break ;;
                        *) print_color $RED "Invalid option!" ;;
                    esac
                done
                ;;
            3)
                while true; do
                    show_devops_menu
                    read -p "Enter your choice [0-6]: " devops_choice
                    case $devops_choice in
                        1) install_application "devops" "docker" ;;
                        2) install_application "devops" "kubernetes" ;;
                        3) install_application "devops" "terraform" ;;
                        4) install_application "devops" "ansible" ;;
                        5) install_application "devops" "jenkins" ;;
                        6) install_application "devops" "aws-cli" ;;
                        0) break ;;
                        *) print_color $RED "Invalid option!" ;;
                    esac
                done
                ;;
            4)
                while true; do
                    show_testing_menu
                    read -p "Enter your choice [0-10]: " test_choice
                    case $test_choice in
                        1) install_application "testing" "postman" ;;
                        2) install_application "testing" "cypress" ;;
                        3) install_application "testing" "selenium" ;;
                        4) install_application "testing" "jmeter" ;;
                        5) install_application "testing" "owasp-zap" ;;
                        6) install_application "testing" "burpsuite" ;;
                        7) install_application "testing" "newman" ;;
                        8) install_application "testing" "artillery" ;;
                        9) install_application "testing" "k6" ;;
                        10) install_application "testing" "playwright" ;;
                        0) break ;;
                        *) print_color $RED "Invalid option!" ;;
                    esac
                done
                ;;
            5)
                while true; do
                    show_sysadmin_menu
                    read -p "Enter your choice [0-3]: " admin_choice
                    case $admin_choice in
                        1) install_application "system-admin" "nginx" ;;
                        2) install_application "system-admin" "apache2" ;;
                        3) install_application "system-admin" "fail2ban" ;;
                        0) break ;;
                        *) print_color $RED "Invalid option!" ;;
                    esac
                done
                ;;
            6)
                while true; do
                    show_productivity_menu
                    read -p "Enter your choice [0-7]: " prod_choice
                    case $prod_choice in
                        1) install_application "productivity" "slack" ;;
                        2) install_application "productivity" "discord" ;;
                        3) install_application "productivity" "teams" ;;
                        4) install_application "productivity" "zoom" ;;
                        5) install_application "productivity" "notion" ;;
                        6) install_application "productivity" "obsidian" ;;
                        7) install_application "productivity" "keybase" ;;
                        0) break ;;
                        *) print_color $RED "Invalid option!" ;;
                    esac
                done
                ;;
            7)
                while true; do
                    show_security_menu
                    read -p "Enter your choice [0-15]: " sec_choice
                    case $sec_choice in
                        1) install_application "security" "owasp-zap" ;;
                        2) install_application "security" "burpsuite" ;;
                        3) install_application "security" "nmap" ;;
                        4) install_application "security" "wireshark" ;;
                        5) install_application "security" "metasploit" ;;
                        6) install_application "security" "nikto" ;;
                        7) install_application "security" "sqlmap" ;;
                        8) install_application "security" "john" ;;
                        9) install_application "security" "hashcat" ;;
                        10) install_application "security" "aircrack-ng" ;;
                        11) install_application "security" "gobuster" ;;
                        12) install_application "security" "hydra" ;;
                        13) install_application "security" "openvas" ;;
                        14) install_application "security" "lynis" ;;
                        15) install_application "security" "clamav" ;;
                        0) break ;;
                        *) print_color $RED "Invalid option!" ;;
                    esac
                done
                ;;
            8)
                while true; do
                    show_multimedia_menu
                    read -p "Enter your choice [0-4]: " media_choice
                    case $media_choice in
                        1) install_application "multimedia" "vlc" ;;
                        2) install_application "multimedia" "obs-studio" ;;
                        3) install_application "multimedia" "gimp" ;;
                        4) install_application "multimedia" "audacity" ;;
                        0) break ;;
                        *) print_color $RED "Invalid option!" ;;
                    esac
                done
                ;;
            9)
                while true; do
                    show_browser_menu
                    read -p "Enter your choice [0-7]: " browser_choice
                    case $browser_choice in
                        1) install_application "browsers" "chrome" ;;
                        2) install_application "browsers" "firefox-dev" ;;
                        3) install_application "browsers" "brave" ;;
                        4) install_application "browsers" "opera" ;;
                        5) install_application "browsers" "edge" ;;
                        6) install_application "browsers" "vivaldi" ;;
                        7) install_application "browsers" "tor" ;;
                        0) break ;;
                        *) print_color $RED "Invalid option!" ;;
                    esac
                done
                ;;
            10)
                while true; do
                    show_monitoring_menu
                    read -p "Enter your choice [0-15]: " mon_choice
                    case $mon_choice in
                        1) install_application "system-utilities" "htop" ;;
                        2) install_application "system-utilities" "glances" ;;
                        3) install_application "system-utilities" "netdata" ;;
                        4) install_application "system-utilities" "prometheus-grafana" ;;
                        5) install_application "system-utilities" "zabbix-agent" ;;
                        6) install_application "system-utilities" "nagios" ;;
                        7) install_application "system-utilities" "collectd" ;;
                        8) install_application "system-utilities" "monit" ;;
                        9) install_application "system-utilities" "fail2ban" ;;
                        10) install_application "system-utilities" "logwatch" ;;
                        11) install_application "system-utilities" "neofetch" ;;
                        12) install_application "system-utilities" "bashtop" ;;
                        13) install_application "system-utilities" "iotop" ;;
                        14) install_application "system-utilities" "nethogs" ;;
                        15) install_application "system-utilities" "tcpdump" ;;
                        0) break ;;
                        *) print_color $RED "Invalid option!" ;;
                    esac
                done
                ;;
            11) install_bulk "development" ;;
            12) install_bulk "devops" ;;
            13) install_bulk "testing" ;;
            14) install_bulk "security" ;;
            15) install_bulk "system-utilities" ;;
            16) handle_multiple_selection ;;
            0)
                print_color $GREEN "Thank you for using Ubuntu Application Installer!"
                exit 0
                ;;
            *)
                print_color $RED "Invalid option! Please try again."
                sleep 2
                ;;
        esac
    done
}

# Run main function
main "$@"
