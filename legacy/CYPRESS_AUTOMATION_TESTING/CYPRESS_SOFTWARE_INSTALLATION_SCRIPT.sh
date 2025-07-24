#!/bin/bash
#===============================================================================
#
#          FILE:  CYPRESS_SOFTWARE_INSTALLATION_SCRIPT.sh
#
#         USAGE:  ./CYPRESS_SOFTWARE_INSTALLATION_SCRIPT.sh
#
#   DESCRIPTION:  Using this Script you can able to install Cypress on your Ubuntu system.
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
#update your system
sudo apt update

#install NodeJS
sudo apt install nodejs npm


#Cypress global installation
sudo npm install -g cypress

version=$(cypress -v)


echo "Congratualation, Your CYPRES is now installed on your ubuntu system, and your software version is $version, Thank you. Deepak Nemade"