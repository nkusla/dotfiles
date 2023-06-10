#/bin/bash

HOME_DIR=/home/$USER

# Creating custom directories
mkdir -p $HOME_DIR/Projects
mkdir -p $HOME_DIR/Pictures/Screenshots

# Full system upgrade and AUR helper installation
sudo pacman -Syyu --noconfirm
sudo pacman -S yay --noconfirm

# Installing from pkglist
yay -S --noconfirm --needed - < $HOME_DIR/.pkglist/pkglist.txt
yay -S --noconfirm --needed - < $HOME_DIR/.pkglist/xfce4-pkglist.txt

# Copying backgrounds
sudo cp $HOME_DIR/.backgrounds/background.png /usr/share/backgrounds
sudo cp $HOME_DIR/.backgrounds/lockscreen.png /usr/share/backgrounds

# Copying lighdm settings
sudo cp $HOME_DIR/.etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm

# Setting up profile picture for lightdm-gtk-greeter
cp $HOME_DIR/.backgrounds/profile.png $HOME_DIR/.face
sudo cp $HOME_DIR/.backgrounds/profile.png /var/lib/AccountsService/icons/$USER
sudo cp $HOME_DIR/.etc/accountsservice.conf /var/lib/AccountsService/users/$USER

# Clearing package cache
yay -Sc --noconfirm

# Rebooting
echo -e "\033[33mRebooting in 5 seconds...\033[0m"
sleep 5s
sudo reboot
