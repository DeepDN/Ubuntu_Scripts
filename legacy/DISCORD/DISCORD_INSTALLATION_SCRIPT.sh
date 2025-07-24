#!/bin/bash

# Update the system
sudo apt update

# Installing Discord
if sudo snap install discord ; then
    echo "Congratualations, Discord is successfully installed on your system"
else
    echo "Sorry, due to some reason we are not able to install Discord"
fi