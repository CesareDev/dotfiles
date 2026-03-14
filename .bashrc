#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='lsd --color=auto --group-directories-first -v --git'
alias ll='lsd -alF --color=auto --group-directories-first -v -A --git'
alias grep='grep --color=auto'
alias q='exit'
alias vim='nvim'

export EDITOR='nvim'

PS1='[\u@\h \W]\$ '

# Init starship
eval "$(starship init bash)"
