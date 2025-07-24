#!/bin/bash



#Update the system
sudo apt update

#adding stable source
sudo sh -c 'echo "deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list.d/opera.list'

#install the Key
sudo sh -c 'wget -O - http://deb.opera.com/archive.key | apt-key add -'


#Update the system again
sudo apt-get update

#install OPERA BROWSER
sudo apt-get install opera


echo "Congratualation, OPERA_BROWSER is successfully installed on your system. Thank you, Deepak Nemade"