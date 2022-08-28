#!/bin/bash

# Import dconf settings and extract home directory backup
echo -e "\033[33mImporting settings and restoring backup...\033[0m"
tar -xzf home-backup.tgz .
cp -rv home-backup/* ~/
dconf load / < settings.conf
