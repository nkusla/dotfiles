#!/bin/bash

dconf dump / > settings.conf
mkdir -p home-backup
cp -vr ~/OpenVPN/ ~/Pictures/ ~/Documents/ ~/Scripts/ ~/.icons/ ~/.themes/ ~/.ssh/ home-backup/
tar -cvzf home-backup.tgz home-backup/
rm -rf home-backup/