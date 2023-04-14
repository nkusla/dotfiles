#/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo -e "\033[31mYou need to run script as root!\033[0m"
	exit
fi

HOME_DIR=/home/$SUDO_USER

# Creating custom directories
mkdir -p $HOME_DIR/Projects && chown $SUDO_USER:$SUDO_USER $HOME_DIR/Projects
mkdir -p $HOME_DIR/Pictures/Screenshots && chown $SUDO_USER:$SUDO_USER $HOME_DIR/Pictures/Screenshots

# Full system upgrade and AUR helper installation
pacman -Syyu --noconfirm
pacman -S yay --noconfirm

# Installing from pkglist
yay -S --noconfirm --needed - < $HOME_DIR/.pkglist/pkglist.txt
yay -S --noconfirm --needed - < $HOME_DIR/.pkglist/xfce4-pkglist.txt

# Copying backgrounds
cp $HOME_DIR/.backgrounds/background.png /usr/share/backgrounds
cp $HOME_DIR/.backgrounds/lockscreen.png /usr/share/backgrounds

# Copying lighdm settings
cp $HOME_DIR/.etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm

# Setting up profile picture for lightdm-gtk-greeter
cp $HOME_DIR/.backgrounds/profile.png $HOME_DIR/.face && chown $SUDO_USER:$SUDO_USER $HOME_DIR/.face
cp $HOME_DIR/.backgrounds/profile.png /var/lib/AccountsService/icons/$SUDO_USER
cp $HOME_DIR/.etc/accountsservice.conf /var/lib/AccountsService/users/$SUDO_USER

# Clearing package cache
yay -Sc --noconfirm

# Rebooting
echo -e "\033[33mRebooting in 5 seconds...\033[0m"
sleep 5s
reboot
