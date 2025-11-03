#!/bin/bash

# Show Available Applications Script
# Lists all available applications in the Ubuntu Scripts installer
# Author: Deepak Nemade (DN)
# Version: 3.0

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

# Function to print header
print_header() {
    clear
    print_color $CYAN "=================================================================="
    print_color $WHITE "           AVAILABLE APPLICATIONS - Ubuntu Installer v3.0"
    print_color $CYAN "=================================================================="
    print_color $YELLOW "  Complete list of applications available for installation"
    print_color $CYAN "=================================================================="
    echo
}

# Function to count applications in a category
count_apps() {
    local category=$1
    local count=0
    
    if [[ -d "categories/$category" ]]; then
        for script in categories/$category/*.sh; do
            if [[ -f "$script" ]]; then
                ((count++))
            fi
        done
    fi
    
    echo $count
}

# Function to show applications in a category
show_category_apps() {
    local category=$1
    local display_name=$2
    local count=$(count_apps "$category")
    
    if [[ $count -gt 0 ]]; then
        print_color $CYAN "$display_name ($count applications):"
        
        for script in categories/$category/*.sh; do
            if [[ -f "$script" ]]; then
                app_name=$(basename "$script" .sh)
                # Convert app name to display format
                display_app=$(echo "$app_name" | sed 's/-/ /g' | sed 's/\b\w/\U&/g')
                print_color $GREEN "   * $display_app"
            fi
        done
        echo
    fi
}

# Main function
main() {
    print_header
    
    # Show categories and their applications
    show_category_apps "development" "Development Tools"
    show_category_apps "devops" "DevOps & Cloud Tools"
    show_category_apps "databases" "Database Systems"
    show_category_apps "testing" "Testing & QA Tools"
    show_category_apps "security" "Security & Penetration Testing"
    show_category_apps "system-admin" "System Administration"
    show_category_apps "system-utilities" "System Utilities & Monitoring"
    show_category_apps "productivity" "Productivity Applications"
    show_category_apps "multimedia" "Multimedia & Graphics"
    show_category_apps "browsers" "Web Browsers"
    
    # Calculate total applications
    local total=0
    for category in categories/*/; do
        if [[ -d "$category" ]]; then
            category_name=$(basename "$category")
            count=$(count_apps "$category_name")
            total=$((total + count))
        fi
    done
    
    print_color $CYAN "=================================================================="
    print_color $WHITE "Total Applications Available: $total"
    print_color $CYAN "=================================================================="
    echo
    print_color $YELLOW "Usage:"
    print_color $GREEN "  ./ubuntu-app-installer.sh    # Run interactive installer"
    print_color $GREEN "  ./categories/development/git.sh    # Install specific app"
    echo
    print_color $BLUE "Created by: Deepak Nemade (DN)"
    print_color $BLUE "Professional System Administrator & DevOps Engineer"
    echo
}

# Run main function
main "$@"
