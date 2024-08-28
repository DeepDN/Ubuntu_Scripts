#!/bin/bash

#Install Vscode Using apt

#Update the system

sudo apt update -y

#install package dependencies 

sudo apt install software-properties-common apt-transport-https wget -y

#Add GPG key

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

#Add repository

sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

#Install Visual studio code

sudo apt install code

#Very with checking verison

code --version


##Thanks follow for more content.


