# Setup

```
cd $HOME
mkdir -p .dotfiles
cd .dotfiles
git clone --bare git@github.com:Kusla75/dotfiles.git
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles
dotfiles reset --hard
```