#!/bin/bash

#Update the system
sudo apt update

#Install node js
sudo apt install nodejs npm

#Create a symbolic link
ln -s /usr/bin/nodejs /usr/bin/node


#check version
node --version

npm --version



