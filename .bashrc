# ~/.bashrc: executed by bash for non-login shells.

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) 
    return;;
esac

# history options
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# check if this is xterm and set colors for prompt
case "$TERM" in
xterm*|rxvt*)
    PS1='[\[\e[0;32m\]\u@\h\[\e[0m\] \[\e[0;34m\]\w\[\e[0;32m\]\[\e[0m\]]\$ '
    ;;
*)
    PS1='[\u@\h \w]\$ '
    ;;
esac

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# sourcing bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
