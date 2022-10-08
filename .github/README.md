# My dotfiles

Just my dotfiles. Nothing special...

## Setup

Repository is intended to be setup as `bare` git repository. This can be done by following these commands:

```
cd $HOME
mkdir -p .dotfiles
cd .dotfiles
git clone --bare git@github.com:Kusla75/dotfiles.git .
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles reset --hard
```
