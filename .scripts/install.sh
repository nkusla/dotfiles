#/bin/bash

# Installing from pkglist
yay -S --noconfirm --needed - < $HOME_DIR/.pkglist/pkglist.txt
yay -S --noconfirm --needed - < $HOME_DIR/.pkglist/xfce4-pkglist.txt
