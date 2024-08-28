#!/bin/bash

#update your system
sudo apt update

#install NodeJS
sudo apt install nodejs npm


#Cypress global installation
sudo npm install -g cypress

version=$(cypress -v)


echo "Congratualation, Your CYPRES is now installed on your ubuntu system, and your software version is $version, Thank you. Deepak Nemade"