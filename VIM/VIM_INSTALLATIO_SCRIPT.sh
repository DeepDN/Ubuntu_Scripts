#!/bin/bash

#Update your system
sudo apt-get update

#Install Vim
sudo apt-get install vim

version=$(vim -v)

echo "your VIM version is ( $version )"

echo "Congratualation, vim is successfully installed"
