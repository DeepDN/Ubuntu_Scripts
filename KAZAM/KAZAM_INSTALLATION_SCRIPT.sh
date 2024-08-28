#!/bin/bash



#changing the directory
#cd /Download/

#puling from the repository in Download directory
sudo apt-add-repository ppa:sylvain-pineau/kazam -y

#Update the system
echo "Updating your system please wait for few minutes"
sudo apt-get update

#Installing the kazam
sudo apt-get install kazam -y


#for check kazam version
version=$(kazam --version)

echo "your KAZAM application version is $version"

#removing downloaded file
rm -rf sylvain-pineau/kazam


echo "Congratualations your KAZAM Application is successfully installed on your system"

echo "Thank you deepak"


echo "Starting KAZAM Automatically"
kazam
