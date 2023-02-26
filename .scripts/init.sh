#/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo -e "\033[31mYou need to run script as root!\033[0m"
	exit
fi

HOMEDIR=/home/$SUDO_USER
mkdir -p $HOMEDIR/Projects

# Full system upgrade and AUR helper installation
pacman -Syyu --noconfirm
pacman -S yay --noconfirm

# Installing from pkglist
yay -S --noconfirm - < $HOMEDIR/.pkglist/pkglist.txt
yay -S --noconfirm - < $HOMEDIR/.pkglist/xfce4-pkglist.txt

# Copying backgrounds
cp $HOMEDIR/.backgrounds/background.png /usr/share/backgrounds
cp $HOMEDIR/.backgrounds/lockscreen.png /usr/share/backgrounds

# Copying lighdm settings
cp $HOMEDIR/.etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm

# Setting up profile picture for lightdm-gtk-greeter
cp $HOMEDIR/.backgrounds/profile.png $HOMEDIR/.face && chown $SUDO_USER:$SUDO_USER $HOMEDIR/.face
cp $HOMEDIR/.backgrounds/profile.png /var/lib/AccountsService/icons/$SUDO_USER
cp $HOMEDIR/.etc/accountsservice.conf /var/lib/AccountsService/users/$SUDO_USER

# Clearing cache
yay -Sc --noconfirm

# Rebooting
echo -e "\033[33mRebooting in 5 seconds...\033[0m"
sleep 5s
reboot
