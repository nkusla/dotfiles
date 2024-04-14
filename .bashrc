# ~/.bashrc: executed by bash for non-login shells.

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return;;
esac

# history options
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# determines how many subdirectories should be shown in shell prompt
PROMPT_DIRTRIM=3

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Git branch prompt
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# check if this is xterm and set colors for prompt
# and change title bar text
case "$TERM" in
xterm*|rxvt*)
	# Sets user shell prompt
    PS1='[\[\e[0;32m\]\u@\h\[\e[0m\] \[\e[0;34m\]\w\[\e[0;32m\]\[\e[0m\]]\e[33m$(parse_git_branch)\e[0m \$ '
	# Sets terminal tab name
    PROMPT_COMMAND='echo -ne "\e]0;${PWD/#$HOME/\~}\a"'
    ;;
*)
	# Sets root user shell prompt
    PS1='[\u@\h \w]\$ '
    ;;
esac

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
fi

# default terminal editor
VISUAL='/usr/bin/nano'
EDITOR='/usr/bin/nano'

# colored GCC warnings and errors
GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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
