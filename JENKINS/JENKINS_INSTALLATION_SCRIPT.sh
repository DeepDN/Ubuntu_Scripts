#!/bin/bash

version=$(jenkins --version)


#update your ubuntu system
sudo apt update

#Installing JDK11 on your system
sudo apt install openjdk-11-jdk -y


#importing GPG key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

#adding Jenkins Repository
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo " Now we are starting to install Jenkins "

#system update
sudo apt update

#Installing jenkins
sudo apt install jenkins -y

#checking jenkins status
sudo timeout 5 systemctl status jenkins


#Modify Firewall rules
sudo ufw allow 8080

#checking Firewall status
sudo ufw status

#enable firewall rules
sudo ufw enable


#Opening Jenking on your default browser.
xdg-open http://localhost:8080

#Jenkins Version
echo "Your Jenkins version is $version "

echo "Congratualation, Jenkins is successfully installed on your system. Thank you, Deepak Nemade"
