# Ubuntu Application Installer v3.0

Professional automation scripts for installing development tools, DevOps utilities, security tools, and applications on Ubuntu systems.

## Features

- **Professional Interface**: Clean, colored terminal interface with DN branding
- **Comprehensive Tool Coverage**: 86+ applications across multiple categories
- **Security-First**: No root execution, proper permission handling
- **Latest Official Sources**: All scripts use official installation methods
- **Bulk Installation**: Quick setup for common development stacks
- **Advanced Security Tools**: Including Wazuh SIEM and USB port blocking

## Complete Application List

### Development Tools (17 applications)
- **Languages**: Node.js (via NVM), Python, Java, Go, Rust, PHP, Ruby
- **Editors**: VS Code, Vim, Sublime Text, Android Studio, IntelliJ, Atom
- **Version Control**: Git & GitHub CLI
- **Terminals**: Warp Terminal
- **Mobile**: Flutter SDK

### DevOps & Cloud Tools (9 applications)
- **Containerization**: Docker (latest official method), Kubernetes
- **Infrastructure**: Terraform, Ansible
- **CI/CD**: Jenkins, GitLab Runner
- **Cloud**: AWS CLI, Azure CLI, Google Cloud SDK

### Database Systems (7 applications)
- **SQL**: PostgreSQL, MySQL, MariaDB, SQLite
- **NoSQL**: MongoDB, Redis
- **Tools**: DBeaver (Universal Database Tool)

### Security & Penetration Testing (10 applications)
- **Network Security**: Nmap, Wireshark, Tcpdump
- **Web Security**: OWASP ZAP, Burp Suite, Nikto
- **Penetration Testing**: Metasploit, John the Ripper, SQLMap
- **SIEM & Monitoring**: Wazuh (All-in-One SIEM Solution)
- **Endpoint Security**: USB Blocker (Block/Unblock USB ports)

### Testing & QA Tools (6 applications)
- **API Testing**: Postman, Newman
- **Load Testing**: JMeter, K6
- **Browser Testing**: Cypress, Selenium

### System Administration (5 applications)
- **Web Servers**: Nginx, Apache2
- **Security**: Fail2ban, UFW Firewall
- **Remote Access**: OpenSSH Server

### System Utilities & Monitoring (8 applications)
- **Process Monitoring**: Htop, Bashtop, Glances
- **Network Monitoring**: Netdata, Tcpdump, Iotop
- **System Info**: Neofetch, Essential Tools

### Productivity Applications (9 applications)
- **Communication**: Slack, Discord, Microsoft Teams, Zoom
- **Office**: LibreOffice, Thunderbird
- **File Transfer**: FileZilla
- **Note Taking**: Notion, Obsidian

### Multimedia & Graphics (8 applications)
- **Media Players**: VLC, Spotify
- **Video Production**: OBS Studio, Kdenlive
- **Graphics**: GIMP, Inkscape, Blender
- **Audio**: Audacity

### Web Browsers (7 applications)
- **Popular**: Google Chrome, Firefox Developer Edition
- **Privacy-Focused**: Brave, Tor Browser
- **Alternative**: Opera, Vivaldi, Microsoft Edge

## Installation

### Quick Start
```bash
git clone https://github.com/your-repo/Ubuntu_Scripts.git
cd Ubuntu_Scripts
chmod +x ubuntu-app-installer.sh
./ubuntu-app-installer.sh
```

### Individual Application Installation
```bash
# Install specific applications
./categories/security/wazuh.sh          # Install Wazuh SIEM
./categories/security/usb-blocker.sh    # USB Port Security Tool
./categories/development/nvm.sh         # Node Version Manager
./categories/devops/docker.sh          # Latest Docker Engine
```

## Quick Install Stacks

### Essential Development Stack
**Installs**: Git, NVM (Node.js), Docker, VS Code, Python
```bash
# Select option 9 from main menu
```

### DevOps Professional Stack
**Installs**: Docker, Kubernetes, Terraform, Ansible, AWS CLI, Jenkins
```bash
# Select option 10 from main menu
```

### Security Testing Stack
**Installs**: Nmap, Wireshark, Burp Suite, OWASP ZAP, Metasploit, Wazuh, USB Blocker
```bash
# Select option 11 from main menu
```

## Key Updates in v3.0

### Added
- **Wazuh SIEM**: Complete security monitoring solution (Manager + Indexer + Dashboard)
- **USB Blocker**: Advanced USB port security with block/unblock options
- **NVM Installation**: Official Node Version Manager script
- **Professional Interface**: Enhanced UI with DN branding

### Updated
- **Docker Script**: Latest official Docker Engine installation method
- **Git Script**: Removed GPG key issues, improved GitHub CLI installation
- **Security Stack**: Now includes 10 comprehensive security tools

### Removed
- **Keybase**: Removed due to GPG key issues
- **Legacy Files**: All unwanted files cleaned up for professional appearance

## Security Features

- **SIEM Integration**: Wazuh for comprehensive security monitoring
- **USB Security**: Block/unblock USB storage devices
- **No Root Execution**: Scripts run as regular user with sudo when needed
- **Official Sources**: All installations use official repositories
- **GPG Verification**: Proper key verification for package sources

## Professional Directory Structure

```
Ubuntu_Scripts/
├── ubuntu-app-installer.sh          # Main professional installer
├── show-available-apps.sh           # List all 86 applications
├── README.md                        # This documentation
├── INSTALLATION_GUIDE.md            # Quick start guide
├── CHANGELOG.md                     # Version history
└── categories/                      # Application categories
    ├── development/                 # 17 development tools
    │   ├── git.sh                  # Git & GitHub CLI
    │   ├── nvm.sh                  # Node Version Manager
    │   ├── docker.sh               # Latest Docker Engine
    │   └── ...
    ├── security/                   # 10 security tools
    │   ├── wazuh.sh               # Wazuh SIEM (NEW)
    │   ├── usb-blocker.sh         # USB Security (NEW)
    │   ├── burpsuite.sh           # Burp Suite Pro
    │   └── ...
    ├── devops/                     # 9 DevOps tools
    ├── databases/                  # 7 database systems
    ├── testing/                    # 6 testing frameworks
    ├── system-admin/               # 5 admin tools
    ├── system-utilities/           # 8 monitoring tools
    ├── productivity/               # 9 productivity apps
    ├── multimedia/                 # 8 multimedia apps
    └── browsers/                   # 7 web browsers
```

## Professional Branding

```
██████╗ ███╗   ██╗
██╔══██╗████╗  ██║
██║  ██║██╔██╗ ██║
██║  ██║██║╚██╗██║
██████╔╝██║ ╚████║
╚═════╝ ╚═╝  ╚═══╝

Created by: Deepak Nemade (DN)
Professional System Administrator & DevOps Engineer
```

## Statistics

- **Total Applications**: 86 applications
- **Categories**: 10 specialized categories
- **Security Tools**: 10 comprehensive security applications
- **Development Tools**: 17 modern development applications
- **Professional Interface**: Complete UI overhaul with branding

## Support & Documentation

- **Issues**: Report bugs and feature requests via GitHub Issues
- **Documentation**: Comprehensive inline documentation in all scripts
- **Updates**: Regular updates with latest software versions
- **Professional Support**: Created by experienced DevOps engineer

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Author

**Deepak Nemade (DN)**
- Professional System Administrator
- DevOps Engineer
- Security Specialist
- Linux Expert

---

*Ubuntu Application Installer v3.0 - Professional automation for modern development and security workflows*
