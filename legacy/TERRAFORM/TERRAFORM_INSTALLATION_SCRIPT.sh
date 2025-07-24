#!/bin/bash

echo "This script is only for UBUNTU"

#Update the system.

sudo apt update

#downloads the GPG (GNU Privacy Guard) key from HashiCorp's official releases server.
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg -y    


#Command adds HashiCorp's official repository to the list of apt sources on your system.
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list


#Again update the system 
sudo apt update 


echo "Installing Terraform to the system"
#install the Terraform
 sudo apt install terraform

echo "congratualations Your teraform is now installed"


#check terraform version

Version=$(terraform --version)


echo "your terraform version is $Version"


echo " Than You, Deepak Nemade"