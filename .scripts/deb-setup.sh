#!/bin/bash

if [ "$EUID" -ne 0 ] 
then
	echo -e "\033[31mYou need to run script as root!\033[0m"
	exit
fi

apt update
apt upgrade -y

mkdir -p ~/Downloads/
cd ~/Downloads/

# CLI utils
echo -e "\033[33mInstalling CLI utils\033[0m"
apt install git nano htop curl wget gpg neofetch openssh-client -y
apt install python3-pip python-is-python3 -y
echo -e "\033[33mCLI utils installed!\033[0m"

# VS Code (https://code.visualstudio.com/docs/setup/linux)
echo -e "\033[33mInstalling Visual Studio Code utils\033[0m"
wget -O ./vscode.deb "https://go.microsoft.com/fwlink/?LinkID=760868"
apt install ./vscode.deb
rm -f ./vscode.deb
echo -e "\033[33mVisual Studio Code installed!\033[0m"

# Google chrome
echo -e "\033[33mInstalling Google Chrome\033[0m"
wget -O ./google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome.deb -y
rm -f ./google-chrome.deb
echo -e "\033[33mGoogle Chrome installed!\033[0m"

# Discord
echo -e "\033[33mInstalling Discord\033[0m"
wget -O ./discord.deb "https://discord.com/api/download?platform=linux&format=deb"
apt install ./discord.deb -y
rm ./discord.deb
echo -e "\033[33mDiscord installed!\033[0m"

# Spotify (https://www.spotify.com/us/download/linux/)
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
apt update
apt install spotify-client -y

# Rebooting 
echo -e "\033[33mRebooting in 5 seconds...\033[0m"
sleep 5s
reboot
