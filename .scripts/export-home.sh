#!/bin/bash

mkdir -p home-backup
cp -vr ~/OpenVPN/ ~/Pictures/ ~/Documents/ ~/.icons/ ~/.themes/ ~/.ssh/ home-backup/
tar -cvzf home-backup.tgz home-backup/
rm -rf home-backup/