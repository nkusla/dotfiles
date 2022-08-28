#!/bin/bash

sudo apt update && sudo apt upgrade

mkdir -p ~/Downloads/
cd ~/Downloads/

# CLI utils
echo -e "\033[33mInstalling CLI utils...\033[0m"
sudo apt install git htop curl wget gpg neofetch dconf-editor openssh-client -y
sudo apt install python3-pip python-is-python3 -y
echo -e "\033[33mCLI utils installed!\033[0m"

# VS Code (https://code.visualstudio.com/docs/setup/linux)
echo -e "\033[33mInstalling Visual Studio Code utils...\033[0m"
wget -O ./vscode.deb "https://go.microsoft.com/fwlink/?LinkID=760868"
sudo apt install ./vscode.deb
rm -f ./vscode.deb
echo -e "\033[33mVisual Studio Code installed!\033[0m"

# Google chrome
echo -e "\033[33mInstalling Google Chrome...\033[0m"
wget -O ./google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome.deb -y
rm -f ./google-chrome.deb
echo -e "\033[33mGoogle Chrome installed!\033[0m"

# Discord
echo -e "\033[33mInstalling Discord...\033[0m"
wget -O ./discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo apt install ./discord.deb -y
rm ./discord.deb
echo -e "\033[33mDiscord installed!\033[0m"

# Spotify (https://www.spotify.com/us/download/linux/)
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client -y

# Gnome specific
echo -e "\033[33mInstalling Gnome packages...\033[0m"
sudo apt install gnome-tweaks gnome-shell-extensions chrome-gnome-shell -y
echo -e "\033[33mGnome packages installed!\033[0m"

# Rebooting 
echo -e "\033[33mRebooting in 5 seconds...\033[0m"
sleep 5s
sudo reboot now

