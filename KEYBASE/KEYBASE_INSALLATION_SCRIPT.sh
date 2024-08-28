#!/bin/bash

#note: This installation is support only for 64 bit version.

#Install Keybase Using terminal

#Update the system

sudo apt update -y

#download the repository using curl command

curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb

#Install the keybase Software

sudo apt install ./keybase_amd64.deb

#Run the software

run_keybase