# Ubuntu Application Installer - Installation Guide

## Quick Start

1. **Clone the repository:**
   ```bash
   git clone https://github.com/DeepDN/Ubuntu_Scripts.git
   cd Ubuntu_Scripts
   ```

2. **Run the main installer:**
   ```bash
   ./ubuntu-app-installer.sh
   ```

3. **Follow the interactive menu to select and install applications**

## What's New in Version 2.0

### Enhanced Features
- **Interactive Menu System**: Navigate through categories with numbered options
- **Organized Structure**: Applications grouped into logical categories
- **Bulk Installation**: Install entire categories at once
- **Color-coded Interface**: Better visual feedback during installation
- **Error Handling**: Robust error checking and recovery
- **Modular Design**: Easy to maintain and extend

### Application Categories

1. **Development Tools** (4 scripts)
   - Visual Studio Code with extensions
   - Git & GitHub CLI with LFS support
   - Node.js, NPM, Yarn with global packages
   - Python with pip, virtual environments, and dev tools

2. **Databases** (2 scripts)
   - PostgreSQL with pgAdmin
   - MongoDB with Compass GUI

3. **DevOps & Cloud Tools** (4 scripts)
   - Docker & Docker Compose
   - Terraform with HashiCorp repository
   - AWS CLI v2 with Session Manager
   - Jenkins CI/CD server

4. **Testing Tools** (2 scripts)
   - Postman with Newman CLI
   - Cypress with testing utilities

5. **System Utilities** (1 script)
   - Essential tools: htop, curl, wget, jq, etc.

6. **Web Browsers** (2 scripts)
   - Google Chrome
   - Firefox Developer Edition

### Directory Structure
```
Ubuntu_Scripts/
├── ubuntu-app-installer.sh    # Main interactive installer
├── categories/                 # Organized installation scripts
│   ├── development/           # Development tools
│   ├── databases/             # Database systems
│   ├── devops/                # DevOps and cloud tools
│   ├── testing/               # Testing frameworks
│   ├── browsers/              # Web browsers
│   └── system-utilities/      # System utilities
├── legacy/                    # Original individual folders
├── demo.sh                    # Demo script
└── README.md                  # Documentation
```

## Usage Examples

### Interactive Installation
```bash
./ubuntu-app-installer.sh
# Select category → Select application → Install
```

### Individual Script Execution
```bash
cd categories/development
./vscode.sh
```

### Demo Mode
```bash
./demo.sh
```

## System Requirements
- Ubuntu 18.04 LTS or later
- Internet connection
- Sudo privileges
- Minimum 2GB free disk space

## Security Features
- Scripts run with minimal required privileges
- GPG key verification for external repositories
- No hardcoded credentials or sensitive data
- Comprehensive error handling

## Contributing
1. Add new scripts to appropriate category folders
2. Follow the existing script template
3. Test thoroughly on clean Ubuntu installation
4. Update the main installer menu system
5. Document any special requirements

## Support
- Check installation logs for troubleshooting
- Run individual scripts for isolated testing
- Submit issues with detailed error messages
- Verify system requirements and compatibility
