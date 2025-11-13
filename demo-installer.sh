#!/bin/bash

# Demo version of Professional Multi-Select Installer
# Shows interface without requiring sudo

set -e

readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly CYAN='\033[0;36m'
readonly WHITE='\033[1;37m'
readonly NC='\033[0m'

declare -a SELECTED_APPS=()

print_color() { printf "${1}${2}${NC}\n"; }

print_header() {
    clear
    print_color $CYAN "=================================================================="
    print_color $WHITE "    PROFESSIONAL UBUNTU APPLICATION INSTALLER v4.0 [DEMO]"
    print_color $CYAN "=================================================================="
    print_color $YELLOW "  Multi-select automation with latest official methods"
    print_color $BLUE "  GitHub: https://github.com/DeepDN/Ubuntu_Scripts"
    print_color $CYAN "=================================================================="
    echo
}

show_category_menu() {
    local category=$1
    local -a apps=()
    
    case $category in
        "development")
            apps=("git" "nodejs" "python" "docker" "vscode" "golang" "rust" "java")
            ;;
        "devops")
            apps=("terraform" "kubectl" "aws-cli" "ansible" "jenkins" "helm")
            ;;
        "database")
            apps=("postgresql" "mysql" "mongodb" "redis" "sqlite3")
            ;;
        "security")
            apps=("nmap" "wireshark" "burpsuite" "owasp-zap" "metasploit")
            ;;
        "system")
            apps=("nginx" "apache2" "htop" "neofetch" "fail2ban")
            ;;
    esac
    
    while true; do
        print_header
        print_color $WHITE "$(echo $category | tr '[:lower:]' '[:upper:]') TOOLS - Select applications:"
        echo
        
        for i in "${!apps[@]}"; do
            local num=$((i + 1))
            local app="${apps[$i]}"
            local status=" "
            
            for selected in "${SELECTED_APPS[@]}"; do
                if [[ "$selected" == "$app" ]]; then
                    status="[X]"
                    break
                fi
            done
            
            if [[ "$status" == "[X]" ]]; then
                print_color $GREEN "$num. $status $app"
            else
                print_color $WHITE "$num. [ ] $app"
            fi
        done
        
        echo
        print_color $YELLOW "Selected apps: ${SELECTED_APPS[*]}"
        echo
        print_color $CYAN "Enter numbers (e.g., 1,3,5) or 'all' for all, 'clear' to clear, 'back' to return:"
        
        read -p "Selection: " selection
        
        case $selection in
            "back"|"b")
                return 0
                ;;
            "clear"|"c")
                for app in "${apps[@]}"; do
                    SELECTED_APPS=($(printf '%s\n' "${SELECTED_APPS[@]}" | grep -v "^$app$"))
                done
                ;;
            "all"|"a")
                for app in "${apps[@]}"; do
                    local found=false
                    for selected in "${SELECTED_APPS[@]}"; do
                        if [[ "$selected" == "$app" ]]; then
                            found=true
                            break
                        fi
                    done
                    if [[ "$found" == false ]]; then
                        SELECTED_APPS+=("$app")
                    fi
                done
                ;;
            *[0-9]*)
                IFS=',' read -ra NUMS <<< "$selection"
                for num in "${NUMS[@]}"; do
                    num=$(echo "$num" | tr -d ' ')
                    if [[ "$num" =~ ^[0-9]+$ ]] && [[ $num -ge 1 ]] && [[ $num -le ${#apps[@]} ]]; then
                        local app="${apps[$((num-1))]}"
                        local found=false
                        for i in "${!SELECTED_APPS[@]}"; do
                            if [[ "${SELECTED_APPS[$i]}" == "$app" ]]; then
                                unset 'SELECTED_APPS[$i]'
                                SELECTED_APPS=("${SELECTED_APPS[@]}")
                                found=true
                                break
                            fi
                        done
                        if [[ "$found" == false ]]; then
                            SELECTED_APPS+=("$app")
                        fi
                    fi
                done
                ;;
        esac
    done
}

demo_install() {
    if [[ ${#SELECTED_APPS[@]} -eq 0 ]]; then
        print_color $YELLOW "No applications selected."
        read -p "Press Enter to continue..."
        return 0
    fi
    
    print_header
    print_color $WHITE "DEMO: Selected applications for installation:"
    for app in "${SELECTED_APPS[@]}"; do
        print_color $GREEN "  - $app"
    done
    echo
    print_color $YELLOW "This is a demo. In the real installer, these would be installed with:"
    echo
    for app in "${SELECTED_APPS[@]}"; do
        print_color $BLUE "Installing $app... [DEMO - NOT ACTUALLY INSTALLING]"
        sleep 0.5
    done
    echo
    print_color $GREEN "Demo installation completed!"
    read -p "Press Enter to continue..."
}

show_main_menu() {
    while true; do
        print_header
        print_color $WHITE "Select application categories:"
        echo
        print_color $GREEN "1. Development Tools (Git, Node.js, Python, Docker, VS Code, etc.)"
        print_color $GREEN "2. DevOps & Cloud (Terraform, Kubernetes, AWS CLI, Ansible, etc.)"
        print_color $GREEN "3. Database Systems (PostgreSQL, MySQL, MongoDB, Redis, etc.)"
        print_color $GREEN "4. Security Tools (Nmap, Wireshark, Burp Suite, OWASP ZAP, etc.)"
        print_color $GREEN "5. System Administration (Nginx, Apache, Monitoring tools, etc.)"
        echo
        print_color $YELLOW "6. Demo Install Selected Applications (${#SELECTED_APPS[@]} selected)"
        print_color $YELLOW "7. Clear All Selections"
        print_color $YELLOW "8. Show Selected Applications"
        echo
        print_color $CYAN "0. Exit"
        echo
        
        read -p "Enter your choice [0-8]: " choice
        
        case $choice in
            1) show_category_menu "development" ;;
            2) show_category_menu "devops" ;;
            3) show_category_menu "database" ;;
            4) show_category_menu "security" ;;
            5) show_category_menu "system" ;;
            6) demo_install ;;
            7) 
                SELECTED_APPS=()
                print_color $GREEN "All selections cleared."
                sleep 1
                ;;
            8)
                print_header
                if [[ ${#SELECTED_APPS[@]} -eq 0 ]]; then
                    print_color $YELLOW "No applications selected."
                else
                    print_color $WHITE "Currently selected applications:"
                    for app in "${SELECTED_APPS[@]}"; do
                        print_color $GREEN "  - $app"
                    done
                fi
                read -p "Press Enter to continue..."
                ;;
            0)
                print_color $GREEN "Thank you for trying the Professional Ubuntu Application Installer!"
                print_color $BLUE "Created by Deepak Nemade (DN)"
                echo
                print_color $CYAN "GitHub Repository: https://github.com/DeepDN/Ubuntu_Scripts"
                print_color $YELLOW "Star the repository if you found it helpful!"
                exit 0
                ;;
            *)
                print_color $RED "Invalid option! Please try again."
                sleep 2
                ;;
        esac
    done
}

print_color $CYAN "Starting Professional Ubuntu Application Installer Demo..."
sleep 2
show_main_menu
