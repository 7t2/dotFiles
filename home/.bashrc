#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
#PS1='[\u@\h \W]\$ '
PS1="\[\e[0m\][\[\e[95m\]\u\[\e[0m\]@\[\e[93m\]\h \[\e[0m\]\W]\$ "
export EDITOR=vim
# For ranger to only read local config
export RANGER_LOAD_DEFAULT_RC=false
