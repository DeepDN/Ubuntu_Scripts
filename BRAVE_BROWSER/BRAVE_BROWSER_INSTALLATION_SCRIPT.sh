#!/bin/bash
#===============================================================================
#
#          FILE:  BRAVE_BROWSER_INSTALLATION_SCRIPT.sh
#
#         USAGE:  ./BRAVE_BROWSER_INSTALLATION_SCRIPT.sh
#
#   DESCRIPTION:  Using this Script you can able to install Brave Browser on your system.
#                 
#
#       OPTIONS:  ---
#  REQUIREMENTS:  bash
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Deepak Nemade (devops.with.deepak@gmail.com)
#       COMPANY:  
#       VERSION:  1.0
#       CREATED:  2025-06-30
#      REVISION:  ---
#===============================================================================
#Installing Curl
sudo apt install curl -y

#pulling the file using curl command
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

#reading the file
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list


#updating the system
sudo apt update

#installing browser
sudo apt install brave-browser -y

#browser version
version=$(brave-browser --version)

echo "Your BRAVE_BROWSER version is ( $version) "

echo "Congratualation Your BRAVE_BROWSER is installed on your system"

echo "Thank You, Deepak Nemade"

