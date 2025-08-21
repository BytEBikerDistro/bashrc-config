# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Set history size
HISTSIZE=1000
HISTFILESIZE=2000

# Check window size after each command and update LINES and COLUMNS
shopt -s checkwinsize

# Enable color support for ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Common aliases
alias q='exit'
alias c='clear'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias cp='cp -rfiv'
alias rm='rm -rfIv'
alias ls='eza --icons'
alias la='eza --icons -a'
alias ll='eza --icons -lah'
alias lt='eza --icons --tree'
alias lta='eza --icons --tree -lah'
alias cat='batcat --theme gruvbox-dark $@'

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Set a custom prompt (e.g., username@hostname:working_directory$)
PS1='\u@\h:\w\$ '

# Add user-specific environment variables
export PATH="$HOME/bin:$PATH"

# Source additional scripts or configurations
# (Add any custom scripts here, e.g., for tools or environments)

# --- Banner Script Section ---
# Place your banner script here or source an external script
if [[ -f ~/.config/mybanner/banner.sh ]]; then
    bash ~/.config/mybanner/banner.sh
fi
