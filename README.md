# Ubuntu Application Installer v2.0 - Professional Bundle

A comprehensive, interactive automation system for installing essential applications on Ubuntu. This repository provides organized installation scripts for developers, testers, system administrators, DevOps professionals, security researchers, and power users.

## 🚀 Features

- **Interactive Menu System**: User-friendly interface with categorized application selection
- **Multiple Selection Support**: Install multiple categories at once (e.g., 1,3,7,9)
- **Comprehensive Coverage**: 84+ professional applications across 10 different categories
- **Bulk Installation**: Install entire categories or individual applications
- **Latest Versions**: All scripts install the most recent stable versions
- **Error Handling**: Robust error checking and recovery mechanisms
- **Color-coded Output**: Clear visual feedback during installation process
- **Modular Architecture**: Organized script structure for easy maintenance and expansion
- **Security-focused**: GPG verification and secure installation methods

## 📦 Quick Start

### One-Command Installation

Clone the repository and run the main installer:

```bash
git clone https://github.com/DeepDN/Ubuntu_Scripts.git
cd Ubuntu_Scripts
./ubuntu-app-installer.sh
```

### View Available Applications

See all available applications:

```bash
./show-available-apps.sh
```

### System Requirements

- Ubuntu 18.04 LTS or later
- Internet connection
- Sudo privileges
- Minimum 8GB free disk space

## 📋 Application Categories

### 1. Development Tools (16 Applications)
Complete development environment setup including:
- **Visual Studio Code**: Latest version with essential extensions
- **Git & GitHub CLI**: Version control with LFS support
- **Node.js & NPM**: LTS version with Yarn and global packages
- **Python**: Python 3 with pip, virtual environments, and dev tools
- **Java**: OpenJDK 17 with Maven, Gradle, Eclipse, IntelliJ IDEA
- **Go**: Latest version with development tools
- **Rust**: Latest stable with Cargo and components
- **PHP**: Latest version with Composer, Laravel, Symfony CLI
- **Ruby & Rails**: Complete Ruby development environment
- **Vim/Neovim**: Enhanced configuration with plugins
- **Sublime Text**: Popular code editor
- **Atom Editor**: GitHub's editor (deprecated but available)
- **Android Studio**: Official Android IDE
- **Flutter SDK**: Google's mobile development framework
- **IntelliJ IDEA**: JetBrains IDE Community Edition
- **Warp Terminal**: Modern, AI-powered terminal

### 2. Databases (7 Applications)
Database servers and management tools:
- **PostgreSQL**: Latest version with pgAdmin web interface
- **MySQL**: Latest version with MySQL Workbench
- **MariaDB**: MySQL-compatible database with tools
- **MongoDB**: Community edition with Compass GUI
- **Redis**: Latest version with Redis Desktop Manager
- **SQLite**: Lightweight database with browser GUI
- **DBeaver**: Universal database management tool

### 3. DevOps & Cloud Tools (9 Applications)
Infrastructure and deployment automation:
- **Docker**: Latest Docker CE with Docker Compose
- **Kubernetes**: kubectl, minikube, helm, k9s tools
- **Terraform**: Latest version from HashiCorp repository
- **Ansible**: Automation platform with additional tools
- **Jenkins**: Latest LTS version CI/CD server
- **GitLab Runner**: CI/CD runner for GitLab
- **AWS CLI**: Version 2 with Session Manager plugin
- **Azure CLI**: Microsoft Azure command-line tools
- **Google Cloud SDK**: Google Cloud Platform tools

### 4. Testing Tools (6 Applications)
Comprehensive testing framework support:
- **Postman**: Latest version with Newman CLI
- **Newman**: Postman CLI runner for automation
- **Cypress**: Latest version with testing utilities
- **Apache JMeter**: Latest version for load testing
- **Selenium WebDriver**: With Chrome and Firefox drivers
- **K6**: Modern load testing tool

### 5. Security & Hacking Tools (8 Applications)
Cybersecurity and penetration testing:
- **OWASP ZAP**: Web application security scanner
- **Burp Suite Community**: Web security testing platform
- **Nmap**: Network discovery and security auditing
- **Wireshark**: Network protocol analyzer
- **Metasploit Framework**: Penetration testing platform
- **Nikto**: Web server vulnerability scanner
- **SQLMap**: SQL injection testing tool
- **John the Ripper**: Password cracking tool

### 6. System Administration (5 Applications)
Server management and security tools:
- **Nginx**: High-performance web server
- **Apache2**: Popular web server with modules
- **Fail2ban**: Intrusion prevention system
- **UFW Firewall**: Uncomplicated firewall with GUI
- **OpenSSH Server**: Secure remote access server

### 7. Productivity Applications (10 Applications)
Essential productivity software:
- **Slack**: Team communication platform
- **Discord**: Voice and text communication
- **Microsoft Teams**: Microsoft's collaboration platform
- **Zoom**: Video conferencing solution
- **Notion**: All-in-one workspace
- **Obsidian**: Knowledge management and note-taking
- **Keybase**: Secure messaging and file sharing
- **LibreOffice**: Complete office suite
- **Thunderbird**: Email client
- **FileZilla**: FTP/SFTP client

### 8. Multimedia Applications (8 Applications)
Media creation and consumption:
- **VLC Media Player**: Universal media player
- **OBS Studio**: Streaming and recording software
- **GIMP**: GNU Image Manipulation Program
- **Audacity**: Audio editing software
- **Spotify**: Music streaming client
- **Kdenlive**: Professional video editor
- **Blender**: 3D creation suite
- **Inkscape**: Vector graphics editor

### 9. Web Browsers (7 Applications)
Modern web browsers with development tools:
- **Google Chrome**: Most popular web browser
- **Firefox Developer Edition**: Mozilla's developer browser
- **Brave Browser**: Privacy-focused browser
- **Opera Browser**: Feature-rich browser
- **Microsoft Edge**: Microsoft's modern browser
- **Vivaldi Browser**: Customizable browser
- **Tor Browser**: Anonymous browsing

### 10. System Utilities & Monitoring (8 Applications)
Essential system tools and monitoring:
- **Essential Tools**: htop, curl, wget, jq, tree, and more
- **Htop**: Interactive process viewer with related tools
- **Glances**: Cross-platform system monitoring
- **Netdata**: Real-time performance monitoring
- **Neofetch**: System information display tool
- **Bashtop/btop**: Beautiful resource monitors
- **Iotop**: I/O monitoring tools
- **Tcpdump**: Network packet analysis tools

## 🎯 Usage Guide

### Interactive Mode

Run the main installer for an interactive experience:

```bash
./ubuntu-app-installer.sh
```

Navigate through categories using the numbered menu system:
1. Select a category (1-10)
2. Choose specific applications or bulk install
3. Follow the installation prompts
4. Return to main menu or exit

### Multiple Selection Mode

Install multiple categories at once:

```bash
./ubuntu-app-installer.sh
# Select option 16
# Enter: 1,3,7,9 (for Development, DevOps, Security, and Browsers)
```

### Bulk Installation Options

Install entire categories with single commands:

```bash
# Install all development tools
./ubuntu-app-installer.sh
# Select option 11

# Install all DevOps tools  
./ubuntu-app-installer.sh
# Select option 12

# Install all security tools
./ubuntu-app-installer.sh
# Select option 14
```

### Individual Script Execution

For advanced users, run individual installation scripts:

```bash
# Navigate to specific category
cd categories/development

# Make script executable and run
chmod +x vscode.sh
./vscode.sh
```

## 📁 Directory Structure

```
Ubuntu_Scripts/
├── ubuntu-app-installer.sh          # Main interactive installer
├── show-available-apps.sh            # Display available applications
├── categories/                       # Organized installation scripts
│   ├── development/                 # Development tools (16 scripts)
│   ├── databases/                   # Database systems (7 scripts)
│   ├── devops/                      # DevOps and cloud tools (9 scripts)
│   ├── testing/                     # Testing frameworks (6 scripts)
│   ├── security/                    # Security tools (8 scripts)
│   ├── system-admin/                # System administration (5 scripts)
│   ├── productivity/                # Productivity applications (10 scripts)
│   ├── multimedia/                  # Media applications (8 scripts)
│   ├── browsers/                    # Web browsers (7 scripts)
│   └── system-utilities/            # System utilities (8 scripts)
├── legacy/                          # Original individual folders
├── demo.sh                          # Demo script
└── README.md                        # This documentation
```

## ⚡ Advanced Features

### Multiple Selection Support
Select multiple categories using comma-separated values:
- Example: `1,3,7,9` installs Development, DevOps, Security, and Browsers
- Supports any combination of category numbers

### Latest Version Installation
All scripts are designed to install the latest stable versions:
- Automatic version detection from official sources
- GPG key verification for security
- Repository-based installations where possible

### Error Recovery
- Automatic system package updates before installation
- Dependency resolution and conflict handling
- Installation verification and rollback capabilities
- Detailed logging for troubleshooting

### Security Considerations
- Scripts run with minimal required privileges
- GPG key verification for external repositories
- Checksum validation for downloaded packages
- Secure credential handling for authenticated installations

## 🛠️ Troubleshooting

### Common Issues

**Permission Denied**
```bash
chmod +x ubuntu-app-installer.sh
```

**Script Not Found Error**
```bash
# Ensure you're in the correct directory
cd Ubuntu_Scripts
ls -la ubuntu-app-installer.sh
```

**Network Connection Issues**
```bash
# Test connectivity
ping -c 4 google.com

# Update package lists
sudo apt update
```

**Dependency Conflicts**
```bash
# Fix broken packages
sudo apt --fix-broken install

# Clean package cache
sudo apt autoclean
```

### Getting Help

1. Check the installation logs in `/tmp/ubuntu-installer.log`
2. Verify system requirements and compatibility
3. Run individual scripts for isolated testing
4. Submit issues with detailed error messages

## 🤝 Contributing

We welcome contributions to expand and improve the Ubuntu Application Installer:

### Adding New Applications

1. Create installation script in appropriate category folder
2. Follow the existing script template and error handling patterns
3. Test thoroughly on clean Ubuntu installation
4. Update the main installer menu system
5. Document any special requirements or configurations

### Improving Existing Scripts

1. Enhance error handling and user feedback
2. Add support for different Ubuntu versions
3. Optimize installation performance
4. Improve security and best practices

### Development Guidelines

- Use bash scripting best practices
- Include comprehensive error checking
- Provide clear user feedback and progress indicators
- Test on multiple Ubuntu versions
- Document any external dependencies
- Follow the established directory structure

## 📄 License

This project is licensed under the MIT License. See the LICENSE file for details.

## 🙏 Acknowledgments

- Ubuntu community for excellent documentation
- Application maintainers for providing installation methods
- Contributors who have helped improve and expand the scripts
- Open source community for inspiration and best practices

## 📞 Support

For support, feature requests, or bug reports:
- Create an issue in the GitHub repository
- Provide detailed system information and error logs
- Include steps to reproduce any problems
- Suggest improvements or new application additions

---

**Note**: This installer is designed for Ubuntu systems. While many scripts may work on other Debian-based distributions, compatibility is not guaranteed. Always review scripts before execution and ensure you understand what they will install on your system.

## 📊 Statistics

- **Total Applications**: 84
- **Categories**: 10
- **Installation Scripts**: 84
- **Supported Ubuntu Versions**: 18.04 LTS and later
- **Installation Methods**: APT, Snap, Direct Download, Repository
- **Security Features**: GPG verification, minimal privileges
- **User Interface**: Interactive menus, color-coded output

