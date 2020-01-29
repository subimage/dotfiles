# ALIASES
# Run from .bash_profile

if [ -e /etc/debian_version ]; then
	# ubuntu / debian support
	alias ls="ls --color -h"
else
	# mac color support
	alias ls="ls -Gh"
fi

alias lf="ls -FA"
alias ll="ls -lh"
alias la="ls -alh"
alias irc="screen irssi"
alias updatedb="locate.updatedb"
alias sudo="sudo env PATH=$PATH "
alias ss="svn status"
alias ssi="svn status --ignore-externals | grep '^[^X]'"

alias b="bundle"
alias bi="b install"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

alias ni="npm install"

alias dotfile='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Source editing
alias subln="subl -n"
alias gd="git diff"
alias gs="git status"
alias gb="git branch"
alias gbd="git branch -d"
alias gco="git checkout"
alias gp="git pull"
alias grso="git remote show origin"

alias v="vagrant"

alias t5="termdown 5m -v Alex"
alias t15="termdown 15m -v Alex"
alias t25="termdown 25m -v Alex"
alias t45="termdown 45m -v Alex"


alias mr="HOST=https://herer.ngrok.io mocha --timeout 15000 --compilers js:babel-register "
alias ip="curl http://ipv4.icanhazip.com"
whitelist () {
  ip=${1:-$(ip)}
  aws ec2 replace-network-acl-entry --network-acl-id acl-14d76071 --rule-number 107 --protocol 6 --rule-action allow --ingress --cidr-block "$ip/32" --port-range From=22,To=22
}
alias pt=papertrail
