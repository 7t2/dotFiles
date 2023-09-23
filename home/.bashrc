#
# ~/.bashrc
#

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

# Custom Prompt
#PS1='[\u@\h \W]\$ '
PS1="\[\e[0m\][\[\e[95m\]\u\[\e[0m\]@\[\e[93m\]\h \[\e[0m\]\W]\$ "

# Environment variables
export EDITOR=vim
# So ranger reads local config, not the global one.
export RANGER_LOAD_DEFAULT_RC=false
