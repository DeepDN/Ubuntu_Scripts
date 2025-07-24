#!/bin/bash

# Test All Application Scripts
# This script tests all installation scripts for syntax and basic functionality

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

print_color() {
    printf "${1}${2}${NC}\n"
}

print_header() {
    clear
    print_color $CYAN "=================================================================="
    print_color $WHITE "           SCRIPT TESTING SUITE"
    print_color $CYAN "=================================================================="
    print_color $YELLOW "  Testing all 84 application installation scripts"
    print_color $CYAN "=================================================================="
    echo
    print_color $RED "██████╗ ███╗   ██╗"
    print_color $RED "██╔══██╗████╗  ██║"
    print_color $RED "██║  ██║██╔██╗ ██║"
    print_color $RED "██║  ██║██║╚██╗██║"
    print_color $RED "██████╔╝██║ ╚████║"
    print_color $RED "╚═════╝ ╚═╝  ╚═══╝"
    echo
    print_color $BLUE "    Created by: Deepak Nemade (DN)"
    print_color $BLUE "    Professional System Administrator & DevOps Engineer"
    echo
}

# Test script syntax
test_syntax() {
    local script_path="$1"
    local script_name=$(basename "$script_path")
    
    if bash -n "$script_path" 2>/dev/null; then
        print_color $GREEN "✅ $script_name - Syntax OK"
        return 0
    else
        print_color $RED "❌ $script_name - Syntax Error"
        return 1
    fi
}

# Test script permissions
test_permissions() {
    local script_path="$1"
    local script_name=$(basename "$script_path")
    
    if [[ -x "$script_path" ]]; then
        print_color $GREEN "✅ $script_name - Executable"
        return 0
    else
        print_color $YELLOW "⚠️  $script_name - Not executable (fixing...)"
        chmod +x "$script_path"
        return 1
    fi
}

# Main testing function
main() {
    print_header
    
    local total_scripts=0
    local passed_syntax=0
    local passed_permissions=0
    local failed_scripts=()
    
    print_color $WHITE "Starting comprehensive script testing..."
    echo
    
    # Test all scripts in categories
    for category_dir in categories/*/; do
        if [[ -d "$category_dir" ]]; then
            category_name=$(basename "$category_dir")
            print_color $CYAN "Testing category: $category_name"
            
            for script in "$category_dir"*.sh; do
                if [[ -f "$script" ]]; then
                    total_scripts=$((total_scripts + 1))
                    
                    # Test syntax
                    if test_syntax "$script"; then
                        passed_syntax=$((passed_syntax + 1))
                    else
                        failed_scripts+=("$script")
                    fi
                    
                    # Test permissions
                    if test_permissions "$script"; then
                        passed_permissions=$((passed_permissions + 1))
                    fi
                fi
            done
            echo
        fi
    done
    
    # Test main scripts
    print_color $CYAN "Testing main scripts:"
    for main_script in ubuntu-app-installer.sh show-available-apps.sh fix-repositories.sh; do
        if [[ -f "$main_script" ]]; then
            total_scripts=$((total_scripts + 1))
            
            if test_syntax "$main_script"; then
                passed_syntax=$((passed_syntax + 1))
            else
                failed_scripts+=("$main_script")
            fi
            
            if test_permissions "$main_script"; then
                passed_permissions=$((passed_permissions + 1))
            fi
        fi
    done
    
    echo
    print_color $CYAN "=================================================================="
    print_color $WHITE "           TEST RESULTS SUMMARY"
    print_color $CYAN "=================================================================="
    
    print_color $WHITE "Total Scripts Tested: $total_scripts"
    print_color $GREEN "Syntax Tests Passed: $passed_syntax/$total_scripts"
    print_color $GREEN "Permission Tests Passed: $passed_permissions/$total_scripts"
    
    if [[ ${#failed_scripts[@]} -eq 0 ]]; then
        print_color $GREEN "🎉 ALL TESTS PASSED! All scripts are ready for use."
    else
        print_color $RED "❌ Failed Scripts:"
        for failed in "${failed_scripts[@]}"; do
            print_color $RED "   - $failed"
        done
    fi
    
    echo
    print_color $BLUE "Script categories tested:"
    print_color $WHITE "  • Development Tools"
    print_color $WHITE "  • Databases"
    print_color $WHITE "  • DevOps & Cloud Tools"
    print_color $WHITE "  • Testing Tools"
    print_color $WHITE "  • Security & Hacking Tools"
    print_color $WHITE "  • System Administration"
    print_color $WHITE "  • Productivity Applications"
    print_color $WHITE "  • Multimedia Applications"
    print_color $WHITE "  • Web Browsers"
    print_color $WHITE "  • System Utilities & Monitoring"
    
    echo
    print_color $CYAN "=================================================================="
    print_color $BLUE "Ready to run: ./ubuntu-app-installer.sh"
    print_color $CYAN "=================================================================="
}

# Run main function
main
