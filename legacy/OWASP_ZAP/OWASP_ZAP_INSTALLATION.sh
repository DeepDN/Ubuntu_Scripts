#!/bin/bash

echo 'deb http://download.opensuse.org/repositories/home:/cabelo/xUbuntu_22.10/ /' | sudo tee /etc/apt/sources.list.d/home:cabelo.list

curl -fsSL https://download.opensuse.org/repositories/home:cabelo/xUbuntu_22.10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_cabelo.gpg > /dev/null

#update your system
sudo apt update

#Install OWASP_ZAP
sudo apt install owasp-zap


echo "congratualation, OWASP ZAP is successfully install on your system, Thank You. Deepak Nemade "