#!/bin/bash

version=$(libreoffice --version)

#update the system
sudo apt update

#installing Libre Office
sudo apt install libreoffice -y

#Libre Office Version
echo "Your Libre_office version is $version "

echo "Congratualation, Libre_offic is successfully installed on your system. Thank you, Deepak Nemade"

