# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Change shell prompt
export PS1='\[$(tput bold)\]\[$(tput setaf 2)\][\u@\h \w\[$(tput setaf 5)\]$(__git_ps1 " (%s)")\[$(tput setaf 2)\]]\$\[$(tput sgr0)\] '

PATH=$PATH:${AWS_EB_HOME}
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"

if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

