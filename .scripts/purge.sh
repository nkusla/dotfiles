#!/bin/bash

f_list=$(/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME ls-tree --full-tree --name-only -r HEAD)

for f in $f_list
do
	rm -f $f
done

rm -rf $HOME/.dotfiles
