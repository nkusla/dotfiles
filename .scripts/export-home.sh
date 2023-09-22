#!/bin/bash

if [ $# -eq 0 ]
then
    printf "Usage: ./export-home.sh <destination_directory>\n"
    exit
fi

mkdir -p home-backup
cp -vr ~/.ssh ~/OpenVPN/ ~/Pictures/ ~/Documents/ home-backup/
tar -cvzf home-backup.tgz home-backup/
rm -rf home-backup/
mv home-backup.tgz $1
