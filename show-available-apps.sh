#!/bin/bash

# Show Available Applications Script
# This script displays all available applications organized by category

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

print_color() {
    printf "${1}${2}${NC}\n"
}

clear
print_color $CYAN "=================================================================="
print_color $WHITE "           COMPREHENSIVE APPLICATION BUNDLE"
print_color $CYAN "=================================================================="
echo

print_color $YELLOW "DEVELOPMENT TOOLS (16 applications):"
print_color $GREEN "  ✓ Visual Studio Code with extensions"
print_color $GREEN "  ✓ Git & GitHub CLI with LFS support"
print_color $GREEN "  ✓ Node.js, NPM, Yarn with global packages"
print_color $GREEN "  ✓ Python with pip, virtual environments, dev tools"
print_color $GREEN "  ✓ Java OpenJDK 17 with Maven, Gradle"
print_color $GREEN "  ✓ Go Programming Language with tools"
print_color $GREEN "  ✓ Rust with Cargo and components"
print_color $GREEN "  ✓ PHP with Composer, Laravel, Symfony"
print_color $GREEN "  ✓ Ruby & Rails development environment"
print_color $GREEN "  ✓ Vim/Neovim with plugins and configuration"
print_color $GREEN "  ✓ Sublime Text editor"
print_color $GREEN "  ✓ Atom Editor (deprecated but available)"
print_color $GREEN "  ✓ Android Studio IDE"
print_color $GREEN "  ✓ Flutter SDK for mobile development"
print_color $GREEN "  ✓ IntelliJ IDEA Community Edition"
print_color $GREEN "  ✓ Warp Terminal (modern terminal)"
echo

print_color $YELLOW "DATABASES (7 applications):"
print_color $GREEN "  ✓ PostgreSQL with pgAdmin"
print_color $GREEN "  ✓ MySQL with MySQL Workbench"
print_color $GREEN "  ✓ MariaDB with tools"
print_color $GREEN "  ✓ MongoDB with Compass GUI"
print_color $GREEN "  ✓ Redis with Desktop Manager"
print_color $GREEN "  ✓ SQLite with SQLite Browser"
print_color $GREEN "  ✓ DBeaver (Universal Database Tool)"
echo

print_color $YELLOW "DEVOPS & CLOUD TOOLS (9 applications):"
print_color $GREEN "  ✓ Docker & Docker Compose"
print_color $GREEN "  ✓ Kubernetes (kubectl, minikube, helm, k9s)"
print_color $GREEN "  ✓ Terraform with HashiCorp repository"
print_color $GREEN "  ✓ Ansible automation platform"
print_color $GREEN "  ✓ Jenkins CI/CD server"
print_color $GREEN "  ✓ GitLab Runner"
print_color $GREEN "  ✓ AWS CLI v2 with Session Manager"
print_color $GREEN "  ✓ Azure CLI"
print_color $GREEN "  ✓ Google Cloud SDK"
echo

print_color $YELLOW "TESTING TOOLS (6 applications):"
print_color $GREEN "  ✓ Postman with Newman CLI"
print_color $GREEN "  ✓ Newman (Postman CLI runner)"
print_color $GREEN "  ✓ Cypress with testing utilities"
print_color $GREEN "  ✓ Apache JMeter for load testing"
print_color $GREEN "  ✓ Selenium WebDriver with browser drivers"
print_color $GREEN "  ✓ K6 modern load testing tool"
echo

print_color $YELLOW "SECURITY & HACKING TOOLS (8 applications):"
print_color $GREEN "  ✓ OWASP ZAP (Web Application Security Scanner)"
print_color $GREEN "  ✓ Burp Suite Community Edition"
print_color $GREEN "  ✓ Nmap with network scanning tools"
print_color $GREEN "  ✓ Wireshark network protocol analyzer"
print_color $GREEN "  ✓ Metasploit Framework"
print_color $GREEN "  ✓ Nikto web server scanner"
print_color $GREEN "  ✓ SQLMap SQL injection tool"
print_color $GREEN "  ✓ John the Ripper password cracker"
echo

print_color $YELLOW "SYSTEM ADMINISTRATION (5 applications):"
print_color $GREEN "  ✓ Nginx web server"
print_color $GREEN "  ✓ Apache2 web server"
print_color $GREEN "  ✓ Fail2ban intrusion prevention"
print_color $GREEN "  ✓ UFW Firewall with GUI"
print_color $GREEN "  ✓ OpenSSH Server"
echo

print_color $YELLOW "PRODUCTIVITY APPLICATIONS (10 applications):"
print_color $GREEN "  ✓ Slack team communication"
print_color $GREEN "  ✓ Discord voice and text chat"
print_color $GREEN "  ✓ Microsoft Teams"
print_color $GREEN "  ✓ Zoom video conferencing"
print_color $GREEN "  ✓ Notion workspace"
print_color $GREEN "  ✓ Obsidian note-taking"
print_color $GREEN "  ✓ Keybase secure messaging"
print_color $GREEN "  ✓ LibreOffice office suite"
print_color $GREEN "  ✓ Thunderbird email client"
print_color $GREEN "  ✓ FileZilla FTP client"
echo

print_color $YELLOW "MULTIMEDIA APPLICATIONS (8 applications):"
print_color $GREEN "  ✓ VLC Media Player"
print_color $GREEN "  ✓ OBS Studio (streaming/recording)"
print_color $GREEN "  ✓ GIMP image editor"
print_color $GREEN "  ✓ Audacity audio editor"
print_color $GREEN "  ✓ Spotify music streaming"
print_color $GREEN "  ✓ Kdenlive video editor"
print_color $GREEN "  ✓ Blender 3D creation suite"
print_color $GREEN "  ✓ Inkscape vector graphics"
echo

print_color $YELLOW "WEB BROWSERS (7 applications):"
print_color $GREEN "  ✓ Google Chrome"
print_color $GREEN "  ✓ Firefox Developer Edition"
print_color $GREEN "  ✓ Brave Browser (privacy-focused)"
print_color $GREEN "  ✓ Opera Browser"
print_color $GREEN "  ✓ Microsoft Edge"
print_color $GREEN "  ✓ Vivaldi Browser"
print_color $GREEN "  ✓ Tor Browser (anonymous browsing)"
echo

print_color $YELLOW "SYSTEM UTILITIES & MONITORING (8 applications):"
print_color $GREEN "  ✓ Essential tools (htop, curl, wget, jq, etc.)"
print_color $GREEN "  ✓ Htop and system monitoring tools"
print_color $GREEN "  ✓ Glances system monitoring"
print_color $GREEN "  ✓ Netdata real-time performance monitoring"
print_color $GREEN "  ✓ Neofetch system information"
print_color $GREEN "  ✓ Bashtop/btop resource monitors"
print_color $GREEN "  ✓ Iotop I/O monitoring tools"
print_color $GREEN "  ✓ Tcpdump network analysis tools"
echo

print_color $CYAN "=================================================================="
print_color $WHITE "TOTAL: 84 Professional Applications across 10 categories"
print_color $CYAN "=================================================================="
echo

print_color $BLUE "To start installation:"
print_color $WHITE "./ubuntu-app-installer.sh"
echo

print_color $BLUE "Advanced Features:"
print_color $GREEN "  • Interactive menu system with 16 options"
print_color $GREEN "  • Multiple selection support (e.g., 1,3,7,9)"
print_color $GREEN "  • Bulk category installation"
print_color $GREEN "  • Latest versions of all applications"
print_color $GREEN "  • Comprehensive error handling and recovery"
print_color $GREEN "  • Color-coded output and progress indicators"
print_color $GREEN "  • Professional applications for all use cases"
print_color $GREEN "  • Security-focused installation methods"
print_color $GREEN "  • Modular architecture for easy expansion"
echo

print_color $BLUE "Categories include:"
print_color $WHITE "Development • Databases • DevOps • Testing • Security"
print_color $WHITE "System Admin • Productivity • Multimedia • Browsers • Utilities"
echo
