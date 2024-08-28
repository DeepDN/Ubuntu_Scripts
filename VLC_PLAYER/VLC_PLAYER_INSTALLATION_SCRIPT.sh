#!/bin/bash

#Update your ubuntu system
sudo apt update

#Installing vlc player
sudo apt install vlc -y


version=$(vlc --version | grep 'VLC version' )

echo "Congratualation, Your VLC Player is now installed on your ubuntu system, and your VLC player version is $version, Thank you. Deepak Nemade"
