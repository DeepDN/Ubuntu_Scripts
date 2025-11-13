#!/bin/bash

# Professional Multi-Select Ubuntu Application Installer v4.0
# Latest official installation methods with checkbox-style selection
# Author: Deepak Nemade (DN)

set -e

# Colors
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly CYAN='\033[0;36m'
readonly WHITE='\033[1;37m'
readonly NC='\033[0m'

# Global arrays
declare -a SELECTED_APPS=()

print_color() { printf "${1}${2}${NC}\n"; }

print_header() {
    clear
    print_color $CYAN "=================================================================="
    print_color $WHITE "    PROFESSIONAL UBUNTU APPLICATION INSTALLER v4.0"
    print_color $CYAN "=================================================================="
    print_color $RED "██████╗ ███╗   ██╗"
    print_color $RED "██╔══██╗████╗  ██║"
    print_color $RED "██║  ██║██╔██╗ ██║"
    print_color $RED "██║  ██║██║╚██╗██║"
    print_color $RED "██████╔╝██║ ╚████║"
    print_color $RED "╚═════╝ ╚═╝  ╚═══╝"
    print_color $YELLOW "  Multi-select automation with latest official methods"
    print_color $BLUE "  GitHub: https://github.com/DeepDN/Ubuntu_Scripts"
    print_color $CYAN "=================================================================="
    echo
}

check_requirements() {
    if [[ $EUID -eq 0 ]]; then
        print_color $RED "ERROR: Do not run as root. Use regular user account."
        exit 1
    fi
    print_color $BLUE "Updating package lists..."
    sudo apt-get update -qq
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
            
            # Check if app is already selected
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
                # Remove apps from this category
                for app in "${apps[@]}"; do
                    SELECTED_APPS=($(printf '%s\n' "${SELECTED_APPS[@]}" | grep -v "^$app$"))
                done
                ;;
            "all"|"a")
                # Add all apps from this category
                for app in "${apps[@]}"; do
                    # Check if not already selected
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
                # Parse comma-separated numbers
                IFS=',' read -ra NUMS <<< "$selection"
                for num in "${NUMS[@]}"; do
                    num=$(echo "$num" | tr -d ' ')
                    if [[ "$num" =~ ^[0-9]+$ ]] && [[ $num -ge 1 ]] && [[ $num -le ${#apps[@]} ]]; then
                        local app="${apps[$((num-1))]}"
                        # Toggle selection
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

install_app() {
    local app=$1
    print_color $BLUE "Installing $app..."
    
    case $app in
        git)
            sudo apt-get install -y git curl
            curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
            echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
            sudo apt-get update && sudo apt-get install -y gh
            ;;
        nodejs)
            curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
            sudo apt-get install -y nodejs
            ;;
        python)
            sudo apt-get install -y python3 python3-pip python3-venv python3-dev build-essential
            ;;
        docker)
            sudo apt-get install -y ca-certificates curl gnupg lsb-release
            sudo mkdir -p /etc/apt/keyrings
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
            echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
            sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
            sudo usermod -aG docker $USER
            ;;
        vscode)
            wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
            sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
            echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
            sudo apt-get update && sudo apt-get install -y code
            rm packages.microsoft.gpg
            ;;
        golang)
            local GO_VERSION=$(curl -s https://go.dev/VERSION?m=text)
            wget -O go.tar.gz "https://go.dev/dl/${GO_VERSION}.linux-amd64.tar.gz"
            sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go.tar.gz
            rm go.tar.gz
            if ! grep -q "/usr/local/go/bin" ~/.bashrc; then
                echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
            fi
            ;;
        rust)
            curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
            ;;
        java)
            sudo apt-get install -y openjdk-17-jdk openjdk-17-jre
            ;;
        terraform)
            wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
            echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null
            sudo apt-get update && sudo apt-get install -y terraform
            ;;
        kubectl)
            curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
            sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
            rm kubectl
            ;;
        aws-cli)
            curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
            sudo apt-get install -y unzip
            unzip awscliv2.zip
            sudo ./aws/install
            rm -rf aws awscliv2.zip
            ;;
        ansible)
            sudo apt-get install -y software-properties-common
            sudo add-apt-repository --yes --update ppa:ansible/ansible
            sudo apt-get install -y ansible
            ;;
        jenkins)
            wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
            echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
            sudo apt-get update && sudo apt-get install -y jenkins
            sudo systemctl enable jenkins && sudo systemctl start jenkins
            ;;
        helm)
            curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
            echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list > /dev/null
            sudo apt-get update && sudo apt-get install -y helm
            ;;
        postgresql)
            sudo apt-get install -y postgresql postgresql-contrib
            sudo systemctl enable postgresql && sudo systemctl start postgresql
            ;;
        mysql)
            sudo apt-get install -y mysql-server
            sudo systemctl enable mysql && sudo systemctl start mysql
            ;;
        mongodb)
            wget -qO - https://www.mongodb.org/static/pgp/server-7.0.asc | sudo apt-key add -
            echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list > /dev/null
            sudo apt-get update && sudo apt-get install -y mongodb-org
            sudo systemctl enable mongod && sudo systemctl start mongod
            ;;
        redis)
            sudo apt-get install -y redis-server
            sudo systemctl enable redis-server && sudo systemctl start redis-server
            ;;
        sqlite3)
            sudo apt-get install -y sqlite3 libsqlite3-dev
            ;;
        nmap)
            sudo apt-get install -y nmap
            ;;
        wireshark)
            echo "wireshark-common wireshark-common/install-setuid boolean true" | sudo debconf-set-selections
            sudo apt-get install -y wireshark
            sudo usermod -aG wireshark $USER
            ;;
        burpsuite)
            sudo apt-get install -y default-jre
            wget -O burpsuite.jar "https://portswigger.net/burp/releases/download?product=community&type=Jar"
            sudo mkdir -p /opt/burpsuite
            sudo mv burpsuite.jar /opt/burpsuite/
            echo '#!/bin/bash' | sudo tee /usr/local/bin/burpsuite > /dev/null
            echo 'java -jar /opt/burpsuite/burpsuite.jar' | sudo tee -a /usr/local/bin/burpsuite > /dev/null
            sudo chmod +x /usr/local/bin/burpsuite
            ;;
        owasp-zap)
            sudo apt-get install -y default-jre
            wget -O zap.tar.gz "https://github.com/zaproxy/zaproxy/releases/download/v2.14.0/ZAP_2_14_0_unix.sh"
            chmod +x ZAP_2_14_0_unix.sh
            sudo ./ZAP_2_14_0_unix.sh -q -dir /opt/zaproxy
            rm ZAP_2_14_0_unix.sh
            ;;
        metasploit)
            curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
            chmod 755 msfinstall
            sudo ./msfinstall
            rm msfinstall
            ;;
        nginx)
            sudo apt-get install -y nginx
            sudo systemctl enable nginx && sudo systemctl start nginx
            ;;
        apache2)
            sudo apt-get install -y apache2
            sudo systemctl enable apache2 && sudo systemctl start apache2
            ;;
        htop)
            sudo apt-get install -y htop
            ;;
        neofetch)
            sudo apt-get install -y neofetch
            ;;
        fail2ban)
            sudo apt-get install -y fail2ban
            sudo systemctl enable fail2ban && sudo systemctl start fail2ban
            ;;
        *)
            print_color $RED "Unknown application: $app"
            return 1
            ;;
    esac
    
    return 0
}

install_selected_apps() {
    if [[ ${#SELECTED_APPS[@]} -eq 0 ]]; then
        print_color $YELLOW "No applications selected."
        read -p "Press Enter to continue..."
        return 0
    fi
    
    print_header
    print_color $WHITE "Selected applications for installation:"
    for app in "${SELECTED_APPS[@]}"; do
        print_color $GREEN "  - $app"
    done
    echo
    
    read -p "Proceed with installation? (y/N): " confirm
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        print_color $YELLOW "Installation cancelled."
        read -p "Press Enter to continue..."
        return 0
    fi
    
    local success_count=0
    local total_count=${#SELECTED_APPS[@]}
    
    for app in "${SELECTED_APPS[@]}"; do
        if install_app "$app"; then
            print_color $GREEN "$app installed successfully"
            ((success_count++))
        else
            print_color $RED "Failed to install $app"
        fi
        echo
    done
    
    print_color $CYAN "Installation Summary:"
    print_color $GREEN "Successfully installed: $success_count/$total_count applications"
    
    if [[ $success_count -lt $total_count ]]; then
        print_color $YELLOW "Some installations failed. Check the output above for details."
    fi
    
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
        print_color $YELLOW "6. Install Selected Applications (${#SELECTED_APPS[@]} selected)"
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
            6) install_selected_apps ;;
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
                print_color $GREEN "Thank you for using Professional Ubuntu Application Installer!"
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

main() {
    check_requirements
    show_main_menu
}

main "$@"
