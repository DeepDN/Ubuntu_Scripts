#!/bin/bash

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

