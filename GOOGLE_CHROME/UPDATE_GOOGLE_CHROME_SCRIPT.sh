#!/bin/bash


#update system
sudo apt update

echo "Pulling the Latest Version"


#pull package
 wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -


echo "Setuping the repository"

#set repository

echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list


#update the system
sudo apt update 

echo " now I am Installing the latest Package"

#Install the latest package
sudo apt install google-chrome-stable


echo "your Browser is now updated successfully"

echo "Thanks you, Deepak Nemade"