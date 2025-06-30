#!/bin/bash
#===============================================================================
#
#          FILE:  PYTHON.sh
#
#         USAGE:  ./PYTHON.sh
#
#   DESCRIPTION:  This script is used to run a python installation script.
#                 
#
#       OPTIONS:  ---
#  REQUIREMENTS:  bash
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Deepak Nemade (devops.with.deepak@gmail.com)
#       COMPANY:  
#       VERSION:  1.0
#       CREATED:  2025-06-30
#      REVISION:  ---
#===============================================================================


#Update the System
sudo apt update -y && sudo apt upgrade -y

#Check previous Python Version
Python3 -V

#Install Python from Source
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev pkg-config wget

wget https://www.python.org/ftp/python/3.12.4/Python-3.12.4.tgz

#Once, downloaded extract the file.
tar -xf Python-3.12.4.tgz

#Enter the Python directory:
tar -xf Python-3.12.4.tgz

#Enable the Python optimizations with the ./configure script for faster code execution
./configure --enable-optimizations

#Once the optimizations step is completed you can proceed with installing the Python 3.12.4
sudo make install

#To verify the installation is successful execute the following command:
python3.12 -V

