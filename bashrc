# .bashrc

alias cdui='cd /Users/gongzhen/Projects/swift/udacity/iosnanodegree/uikit'

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source cs161 definitions
CS161_BASHRC_DIR=~/Projects/cs161/cs161-bashrc
source $CS161_BASHRC_DIR/git-prompt.sh
source $CS161_BASHRC_DIR/aliases.sh
export GIT_PS1_SHOWDIRTYSTATE=1

# User specific aliases and functions
PATH="$HOME"/Projects/cs161/sys161/bin:"$HOME"/Projects/cs161/sys161/tools/bin:$PATH

# Change shell prompt
export PS1='\[$(tput bold)\]\[$(tput setaf 2)\][\u@\h \w\[$(tput setaf 5)\]$(__git_ps1 " (%s)")\[$(tput setaf 2)\]]\$\[$(tput sgr0)\] '

export PATH=$PATH:~/Projects/cs161/os161/tools/bin

export PATH=$PATH:/Users/gongzhen/Projects/pintos_mac/bin

AWS_EB_HOME = /Users/gongzhen/Public/AWS-ElasticBeanstalk-CLI-2.6.4/eb/macosx/python2.7
PATH=$PATH:${AWS_EB_HOME}
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"


