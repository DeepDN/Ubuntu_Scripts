# Ubuntu Application Installer v3.0 - Changelog

## Major Updates Completed

### Added New Security Features
- **Wazuh SIEM**: Complete all-in-one SIEM solution (Manager + Indexer + Dashboard)
- **USB Blocker**: Advanced USB port security tool with block/unblock options
- **Security Menu**: Interactive menu for all 10 security tools
- **Enhanced Security Stack**: Now includes Wazuh and USB blocker in quick install

### Added Development Features
- **NVM Installation Script**: Official Node Version Manager installation (`categories/development/nvm.sh`)
- **Professional Interface**: Enhanced main installer with DN branding and colored output
- **Streamlined Structure**: Removed unnecessary files and kept only essential scripts

### Updated Scripts
- **Docker Script**: Updated to use latest official Docker Engine installation method
- **Git Script**: Removed GPG key issues, improved GitHub CLI installation
- **Node.js Script**: Now redirects to NVM installation for better version management
- **Main Installer**: Completely rewritten with professional interface and better error handling
- **Security Stack**: Updated to include all 10 security tools including Wazuh and USB blocker

### Removed Issues
- **Keybase Script**: Removed due to GPG key issues as requested
- **Legacy Files**: Cleaned up all unwanted files and directories
- **Demo Scripts**: Removed demo and test files to keep only production-ready scripts

### Professional Improvements
- **Clean Directory Structure**: Only essential files remain
- **Professional Branding**: DN logo and professional messaging throughout
- **Better Documentation**: Updated README with complete application list
- **Error Handling**: Improved error checking and user feedback
- **Interactive Menus**: Full security menu with all tools listed

## Current Directory Structure

```
Ubuntu_Scripts/
├── ubuntu-app-installer.sh          # Main professional installer
├── show-available-apps.sh           # List all available applications  
├── README.md                        # Professional documentation
├── INSTALLATION_GUIDE.md            # Quick start guide
├── CHANGELOG.md                     # This file
└── categories/                      # Application categories
    ├── development/                 # 17 development tools
    │   ├── git.sh                  # Updated - removed GPG issues
    │   ├── nvm.sh                  # NEW - Node Version Manager
    │   ├── nodejs.sh               # Updated - redirects to NVM
    │   └── ...
    ├── devops/                     # 9 DevOps tools
    │   ├── docker.sh               # Updated - official method
    │   └── ...
    ├── security/                   # 10 security tools
    │   ├── wazuh.sh               # NEW - SIEM solution
    │   ├── usb-blocker.sh         # NEW - USB port security
    │   ├── burpsuite.sh           # Burp Suite Pro
    │   └── ...
    ├── databases/                  # 7 database systems
    ├── testing/                    # 6 testing tools
    ├── system-admin/               # 5 admin tools
    ├── system-utilities/           # 8 monitoring tools
    ├── productivity/               # 9 productivity apps (Keybase removed)
    ├── multimedia/                 # 8 multimedia apps
    └── browsers/                   # 7 web browsers
```

## Statistics

- **Total Applications**: 86 applications across 10 categories
- **Security Tools**: 10 comprehensive security applications (including Wazuh SIEM and USB blocker)
- **Files Removed**: All legacy files, demos, and unwanted documentation
- **Scripts Updated**: Docker, Git, Node.js with latest official methods
- **New Scripts**: NVM, Wazuh SIEM, USB Blocker
- **Professional Interface**: Complete UI overhaul with DN branding

## Key Technical Improvements

### Wazuh SIEM Installation
- All-in-one installation (Manager + Indexer + Dashboard)
- Official Wazuh repository integration
- Automatic service configuration
- Firewall setup and access information

### USB Blocker Security Tool
- Interactive menu with 4 options
- Block/unblock USB storage devices
- Multiple blocking methods (blacklist, udev rules)
- Status checking and device listing
- Professional colored interface

### Security Menu Integration
- Complete interactive security menu
- All 10 security tools accessible
- Professional descriptions for each tool
- Integrated into main installer workflow

### Enhanced Security Stack
- Updated quick install option 11
- Now includes Wazuh SIEM and USB blocker
- Comprehensive security toolkit installation
- Professional security workflow

## Ready for Production

The Ubuntu Application Installer v3.0 is now:
- Professional and clean with 86 applications
- Complete security toolkit with SIEM and USB blocking
- Uses latest official installation methods
- Free of GPG key issues
- Well-documented and branded
- Ready for professional security and development use

---

**Completed by: Deepak Nemade (DN)**  
**Date: November 2025**  
**Version: 3.0**
