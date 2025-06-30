#!/bin/bash
#===============================================================================
#
#          FILE:  AWSCLI_INSTALLATION_SCRIPT.sh
#
#         USAGE:  ./AWSCLI_INSTALLATION_SCRIPT.sh
#
#   DESCRIPTION:  Using this Script you can able to install AWS CLI on your system.
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

version=$(aws --version)

#update system
sudo apt update

#install curl
sudo apt install curl unzip

#download latest version of AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

#Unzip downloaded file
unzip awscliv2.zip

#Install AWS CLI
sudo ./aws/install




echo "Congratualation, Your AWS CLI is successfully installed on your ubuntu system and AWS CLI version is ($version), Thank you, Deepak Nemade"