# Professional Ubuntu Application Installer

Multi-select automation script for installing development tools with latest official methods.

## Quick Start

```bash
git clone https://github.com/DeepDN/Ubuntu_Scripts.git
cd Ubuntu_Scripts
chmod +x multi-select-installer.sh
./multi-select-installer.sh
```

## Features

- **Multi-Select Interface**: Choose multiple applications across categories
- **Latest Official Methods**: All installations use official repositories
- **Professional Design**: Clean interface without emojis
- **30+ Applications**: Comprehensive tool coverage
- **Security-First**: No root execution, proper permissions

## Application Categories

### Development Tools (8 apps)
Git, Node.js, Python, Docker, VS Code, Go, Rust, Java

### DevOps & Cloud (6 apps)
Terraform, Kubernetes, AWS CLI, Ansible, Jenkins, Helm

### Database Systems (5 apps)
PostgreSQL, MySQL, MongoDB, Redis, SQLite

### Security Tools (5 apps)
Nmap, Wireshark, Burp Suite, OWASP ZAP, Metasploit

### System Administration (5 apps)
Nginx, Apache, Htop, Neofetch, Fail2ban

## Complete Usage Guide

### Step 1: Run the Script
```bash
./multi-select-installer.sh
```

### Step 2: Main Menu Navigation
You'll see the main menu:
```
Select application categories:

1. Development Tools (Git, Node.js, Python, Docker, VS Code, etc.)
2. DevOps & Cloud (Terraform, Kubernetes, AWS CLI, Ansible, etc.)
3. Database Systems (PostgreSQL, MySQL, MongoDB, Redis, etc.)
4. Security Tools (Nmap, Wireshark, Burp Suite, OWASP ZAP, etc.)
5. System Administration (Nginx, Apache, Monitoring tools, etc.)

6. Install Selected Applications (0 selected)
7. Clear All Selections
8. Show Selected Applications

0. Exit
```

### Step 3: Application Selection Screen
Choose a category (1-5) to see applications:
```
DEVELOPMENT TOOLS - Select applications:

1. [ ] git
2. [ ] nodejs
3. [ ] python
4. [ ] docker
5. [ ] vscode
6. [ ] golang
7. [ ] rust
8. [ ] java

Selected apps: 

Enter numbers (e.g., 1,3,5) or 'all' for all, 'clear' to clear, 'back' to return:
Selection: 
```

### Step 4: Selection Methods

**Select Multiple Applications:**
```
Selection: 1,3,5
# Selects: git, python, vscode
```

**Select All Applications:**
```
Selection: all
# Selects all applications in the category
```

**Clear Current Category:**
```
Selection: clear
# Removes all selections from current category
```

**Return to Main Menu:**
```
Selection: back
# Goes back to main category menu
```

### Step 5: Build Your Selection
- Select applications from multiple categories
- Your selections persist across categories
- Main menu shows total selected count
- Use option 8 to review all selections

### Step 6: Installation Process
1. Choose option `6` from main menu
2. Review your selections:
   ```
   Selected applications for installation:
     - git
     - python
     - docker
     - terraform
     - postgresql
   ```
3. Confirm installation: Type `y` and press Enter
4. Monitor installation progress:
   ```
   Installing git...
   git installed successfully
   
   Installing python...
   python installed successfully
   
   Installing docker...
   docker installed successfully
   ```

## Complete Example Walkthrough

```bash
# 1. Start the installer
./multi-select-installer.sh

# 2. Choose Development Tools
Enter your choice [0-8]: 1

# 3. Select git, python, and docker
Selection: 1,3,4

# 4. Go back to main menu
Selection: back

# 5. Choose DevOps Tools
Enter your choice [0-8]: 2

# 6. Select terraform and aws-cli
Selection: 1,3

# 7. Go back to main menu
Selection: back

# 8. Install selected applications
Enter your choice [0-8]: 6

# 9. Confirm installation
Proceed with installation? (y/N): y

# 10. Wait for installation to complete
```

## Installation Methods

All applications use official sources:
- **Repositories**: GitHub CLI, NodeSource, Docker, Microsoft, HashiCorp
- **Direct Downloads**: Go (go.dev), AWS CLI, kubectl
- **Package Managers**: Ubuntu official repositories
- **Installers**: Rust (rustup), Metasploit (official script)

## Quick Reference

| Command | Action |
|---------|--------|
| `1,3,5` | Select applications 1, 3, and 5 |
| `all` | Select all applications in category |
| `clear` | Clear all selections from current category |
| `back` | Return to main menu |
| `y` | Confirm installation |

## Demo Mode

Test the interface without installation:
```bash
./demo-installer.sh
```

## Requirements

- Ubuntu 20.04 LTS or newer
- Internet connection
- Sudo access
- 2GB RAM, 10GB free space

## Author

**Deepak Nemade (DN)**  
Professional System Administrator & DevOps Engineer

## Repository

**Star this repository**: https://github.com/DeepDN/Ubuntu_Scripts

## License

MIT License
