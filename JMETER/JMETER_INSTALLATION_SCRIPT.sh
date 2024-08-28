#!/bin/bash

#Update the system
sudo apt update


#Install JAVA JDK8
apt-get install openjdk-8-jdk -y

echo "JAVA (JDK-8) successfully installed on your system"

#Check JAVA version
java --version

##Install Apache Web server
echo "now we are installing Apache webserver"

sudo apt-get install apache2 -y


#Start the service

sudo timeout 5 systemctl start apache2

#Enable apache server
systemctl enable apache2

echo "now we are installing apache Jmeter"

#downloading Zip file 
wget https://downloads.apache.org//jmeter/binaries/apache-jmeter-5.3.zip


#unzip the downloaded file
unzip apache-jmeter-5.3.zip

#navigate the file
cd apache-jmeter-5.3/bin

#start Jmeter
./jmeter