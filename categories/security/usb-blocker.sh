#!/bin/bash

# USB Port Blocker Script for Linux/Ubuntu
# This script provides options to block or unblock USB storage devices

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_color() {
    printf "${1}${2}${NC}\n"
}

print_header() {
    clear
    print_color $BLUE "=================================================================="
    print_color $YELLOW "           USB PORT BLOCKER - Security Tool"
    print_color $BLUE "=================================================================="
    echo
}

show_menu() {
    print_header
    print_color $GREEN "Select USB Blocking Option:"
    echo
    print_color $GREEN "1. Block USB Storage Devices"
    print_color $GREEN "2. Unblock USB Storage Devices"
    print_color $GREEN "3. Check Current USB Status"
    print_color $GREEN "4. List Connected USB Devices"
    echo
    print_color $RED "0. Exit"
    echo
}

block_usb() {
    print_color $YELLOW "Blocking USB storage devices..."
    
    # Method 1: Blacklist USB storage modules
    echo "blacklist usb-storage" | sudo tee /etc/modprobe.d/blacklist-usb.conf > /dev/null
    echo "blacklist uas" | sudo tee -a /etc/modprobe.d/blacklist-usb.conf > /dev/null
    
    # Method 2: Remove existing modules
    sudo modprobe -r usb-storage 2>/dev/null || true
    sudo modprobe -r uas 2>/dev/null || true
    
    # Method 3: Create udev rule to block USB storage
    echo 'SUBSYSTEM=="usb", ATTR{bDeviceClass}=="08", RUN+="/bin/sh -c \"echo 1 > /sys/\$devpath/remove\""' | sudo tee /etc/udev/rules.d/99-block-usb-storage.rules > /dev/null
    
    # Reload udev rules
    sudo udevadm control --reload-rules
    
    print_color $GREEN "USB storage devices blocked successfully!"
    print_color $YELLOW "Note: Reboot required for complete effect"
}

unblock_usb() {
    print_color $YELLOW "Unblocking USB storage devices..."
    
    # Remove blacklist file
    sudo rm -f /etc/modprobe.d/blacklist-usb.conf
    
    # Remove udev rule
    sudo rm -f /etc/udev/rules.d/99-block-usb-storage.rules
    
    # Reload modules
    sudo modprobe usb-storage 2>/dev/null || true
    sudo modprobe uas 2>/dev/null || true
    
    # Reload udev rules
    sudo udevadm control --reload-rules
    sudo udevadm trigger
    
    print_color $GREEN "USB storage devices unblocked successfully!"
}

check_status() {
    print_color $YELLOW "Checking USB blocking status..."
    echo
    
    if [[ -f /etc/modprobe.d/blacklist-usb.conf ]]; then
        print_color $RED "USB Storage: BLOCKED (blacklist active)"
    else
        print_color $GREEN "USB Storage: ALLOWED (no blacklist)"
    fi
    
    if [[ -f /etc/udev/rules.d/99-block-usb-storage.rules ]]; then
        print_color $RED "USB Devices: BLOCKED (udev rule active)"
    else
        print_color $GREEN "USB Devices: ALLOWED (no udev rule)"
    fi
    
    if lsmod | grep -q usb_storage; then
        print_color $GREEN "USB Storage Module: LOADED"
    else
        print_color $RED "USB Storage Module: NOT LOADED"
    fi
}

list_usb_devices() {
    print_color $YELLOW "Connected USB devices:"
    echo
    lsusb
    echo
    print_color $YELLOW "USB storage devices:"
    lsblk -o NAME,SIZE,TYPE,MOUNTPOINT | grep -E "(usb|removable)" || print_color $RED "No USB storage devices found"
}

main() {
    if [[ $EUID -ne 0 ]] && [[ -z "$SUDO_USER" ]]; then
        print_color $RED "This script requires sudo privileges."
        exit 1
    fi
    
    while true; do
        show_menu
        read -p "Enter your choice [0-4]: " choice
        
        case $choice in
            1)
                block_usb
                read -p "Press Enter to continue..."
                ;;
            2)
                unblock_usb
                read -p "Press Enter to continue..."
                ;;
            3)
                check_status
                read -p "Press Enter to continue..."
                ;;
            4)
                list_usb_devices
                read -p "Press Enter to continue..."
                ;;
            0)
                print_color $GREEN "Exiting USB Blocker..."
                exit 0
                ;;
            *)
                print_color $RED "Invalid option! Please try again."
                sleep 2
                ;;
        esac
    done
}

main "$@"
