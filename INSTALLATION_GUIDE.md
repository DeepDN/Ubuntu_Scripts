# Ubuntu Application Installer v3.0 - Installation Guide

## Quick Start

### 1. Clone the Repository
```bash
git clone https://github.com/your-repo/Ubuntu_Scripts.git
cd Ubuntu_Scripts
```

### 2. Make Scripts Executable
```bash
chmod +x ubuntu-app-installer.sh
chmod +x show-available-apps.sh
```

### 3. Run the Installer
```bash
./ubuntu-app-installer.sh
```

## Individual Application Installation

### Install Specific Applications
```bash
# Install Docker
./categories/devops/docker.sh

# Install Git with GitHub CLI
./categories/development/git.sh

# Install NVM (Node Version Manager)
./categories/development/nvm.sh

# Install VS Code
./categories/development/vscode.sh
```

## Quick Install Stacks

### Essential Development Stack
Includes: Git, NVM (Node.js), Docker, VS Code, Python
```bash
# Select option 9 from main menu
./ubuntu-app-installer.sh
```

### DevOps Professional Stack
Includes: Docker, Kubernetes, Terraform, Ansible, AWS CLI, Jenkins
```bash
# Select option 10 from main menu
./ubuntu-app-installer.sh
```

### Security Testing Stack
Includes: Nmap, Wireshark, Burp Suite, OWASP ZAP, Metasploit
```bash
# Select option 11 from main menu
./ubuntu-app-installer.sh
```

## View Available Applications
```bash
./show-available-apps.sh
```

## Key Features

- **86 Applications** across 10 categories
- **Official Installation Methods** - All scripts use latest official sources
- **No Root Required** - Scripts run as regular user with sudo when needed
- **Professional Interface** - Clean, colored terminal interface
- **Error Handling** - Robust error checking and user feedback

## Updated in v3.0

### Added
- **NVM Installation**: Official Node Version Manager script
- **Updated Docker**: Latest official Docker installation method
- **Professional Interface**: Enhanced UI with DN branding

### Updated
- **Git Script**: Removed GPG key issues, added GitHub CLI
- **Docker Script**: Official Docker Engine installation method
- **Node.js Script**: Now uses NVM for better version management

### Removed
- **Keybase**: Removed due to GPG key issues
- **Legacy Files**: Cleaned up old documentation and demo files

## System Requirements

- Ubuntu 18.04 LTS or later
- Internet connection
- Regular user account (not root)
- Sudo privileges

## Support

For issues or feature requests, please create an issue in the GitHub repository.

---

**Created by: Deepak Nemade (DN)**  
Professional System Administrator & DevOps Engineer
