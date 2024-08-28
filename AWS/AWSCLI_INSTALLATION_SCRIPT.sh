#!/bin/bash


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