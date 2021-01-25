export PATH=~/bin:/opt/ruby-enterprise/bin:/opt/ruby/bin:/opt/local/bin:/usr/local/bin:/usr/local/sbin:/sw/bin:/sw/sbin:/usr/bin:/usr/sbin:/usr/local/opt/mysql/bin:/bin:/sbin:$PATH

# init rbenv
if [ -e ~/.rbenv ]; then
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi

# init nodenv
if [ -e ~/.nodenv ]; then
	export PATH="$HOME/.nodenv/bin:$PATH"
	eval "$(nodenv init -)"
fi

# load up fink paths if the system has fink on it
if [ -e /sw/bin/init.sh ]; then
  . /sw/bin/init.sh
fi

# prepend /usr/local paths if anything is installed there
if [ -e /usr/local ]; then
  export MANPATH=/usr/local/share/man:$MANPATH
  export INFOPATH=/usr/local/share/info:$INFOPATH
fi

# Include aliases
if [ -e $HOME/.bash_aliases ] ; then
  source $HOME/.bash_aliases
fi

# Set prompt
if [ -e $HOME/.bash_prompt ] ; then
  source $HOME/.bash_prompt
fi

# Include standard ENV variables, can contain secrets for Rails apps, production machines, etc
if [ -e $HOME/.env ] ; then
  source $HOME/.env
fi

# Bash history
# https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# This one contains secret stuff on a per-machine basis.
if [ -e $HOME/.env_secrets ] ; then
  source $HOME/.env_secrets
fi

if [ hash "dircolors" 2>/dev/null ] ; then
  # dircolors on linux
  if [ -e $HOME/.bash_ls_colors ] ; then
    eval $(dircolors -b $HOME/.bash_ls_colors)
  fi
else 
  # mac
  #export CLICOLOR=true
  #export CLICOLOR_FORCE=true
  export LSCOLORS=GxFxcxdxBxegGdaBagahad
fi

# vi-like behavior for bash
set -o vi 
#umask 77
