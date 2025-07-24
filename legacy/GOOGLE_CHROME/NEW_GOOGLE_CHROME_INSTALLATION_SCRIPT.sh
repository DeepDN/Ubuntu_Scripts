#!/bin/bash

#update the system

sudo apt update

#change the directory

cd /Download/


echo "now your are in Download directory"




#pull the file from web using wget command

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb


#run package
sudo dpkg -i ./google-chrome*.deb


#install package

sudo apt-get install -f


echo "Package Successfully installed"


echo "now removing the .deb package from the direcetory"

#removing .deb package
rm -rf google-chrome-stable_current_amd64.deb

#Installation COmpleted
echo "Thank you Deepak Nemade "