#!/bin/bash

if [ "$EUID" -ne 0 ] 
then
	echo -e "\033[31mYou need to run script as root!\033[0m"
	exit
fi

# Gnome specific
echo -e "\033[33mInstalling Gnome packages...\033[0m"
apt install dconf-editor gnome-tweaks gnome-shell-extensions chrome-gnome-shell -y
echo -e "\033[33mGnome packages installed!\033[0m"

read -p "Import gnome settings [y/n]: " input 
if [[ "$input" == [nN] ]]
then
	exit
elif [[ "$input" == [yY] ]]
then
	dconf load / < gnome.conf
	echo -e "\033[33mGnome settings imported\033[0m"
else
	echo -e "\033[31mInvalid input!\033[0m"
	exit
fi