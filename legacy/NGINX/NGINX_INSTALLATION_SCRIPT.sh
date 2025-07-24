#!/bin/bash


#Update the System

sudo apt update -y

#Install Nginx

sudo apt install nginx

#check Installation using version

nginx --version

#start and enable nginx

sudo systemctl start nginx

sudo systemctl enable nginx.


#Remove unwanted packages

sudo apt autoremove

#Thank you