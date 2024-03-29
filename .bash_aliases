# ~/.bash_aliases: executed by ~/.bashrc

# dotfiles repo alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# ls aliases
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -lhAF'

# cd aliases
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

# grep aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias c="clear"
alias du="du -h"
alias cat="bat --theme=OneHalfDark"
alias minecraft="java -jar ~/Games/TLauncher-*/TLauncher-*.jar"
