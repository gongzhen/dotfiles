# ~/.bash_profile

# add various directories to PATH
export PATH=$PATH:/opt/local/bin
PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH
export PATH
# export PATH=${PATH}:/usr/local/mysql/bin
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# BLOCKS
export BLOCKS_REDIS_HOST=localhost:6379
export BLOCKS_DB_READ_URL=jdbc:mysql://localhost:3306/grindr_blocks
export BLOCKS_DB_READ_MAX_CONNECTIONS=1
export BLOCKS_DB_READ_USER=<user>
export BLOCKS_DB_READ_PASSWORD=<password>
export BLOCKS_DB_WRITE_URL=jdbc:mysql://localhost:3306/grindr_blocks
export BLOCKS_DB_WRITE_MAX_CONNECTIONS=1
export BLOCKS_DB_WRITE_USER=<user>
export BLOCKS_DB_WRITE_PASSWORD=<password>

# FAVORITES
export FAVES_REDIS_HOST=localhost:6379
export FAVES_DB_READ_URL=jdbc:mysql://localhost:3306/grindr_favorites
export FAVES_DB_READ_MAX_CONNECTIONS=1
export FAVES_DB_READ_USER=<user>
export FAVES_DB_READ_PASSWORD=<password>
export FAVES_DB_WRITE_URL=jdbc:mysql://localhost:3306/grindr_favorites
export FAVES_DB_WRITE_MAX_CONNECTIONS=1
export FAVES_DB_WRITE_USER=<user>
export FAVES_DB_WRITE_PASSWORD=<password>

# http://stackoverflow.com/questions/12870928/mac-bash-git-ps1-command-not-found
source ~/.git-prompt.sh
# umask
umask 022

# aliases
alias ll='ls -al'
alias l='ls -l'
alias mc='mc -cu'
alias ..='cd ..'
alias ...='cd ../..'
alias ack='ack-grep'
alias diff='colordiff -u'
alias wtf='git wtf'

# g alias with bash completion
alias g='git'
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null || complete -o default -o nospace -F _git g

# rails
alias r='rails'
alias b='bundle'
alias bundler='bundle'
alias bi='b install'
alias bu='b update'
alias be='b exec'

# Rails production environment by default for all non-development machines
[[ $(hostname -s) != 'ubuntu' ]] && [[ $(hostname -s) != 'genesis' ]] && export RAILS_ENV="production"

# Heroku
alias hcp='heroku console --remote production'
alias hcs='heroku console --remote staging'
alias hlp='heroku logs -t --remote production'
alias hls='heroku logs -t --remote staging'

# colored ls (one version for GNU, other for Mac OS X)
if `which dircolors` > /dev/null; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
else
  export CLICOLOR=1
fi

# make less always work with colored input
alias less='less -R'

# make watch always work with colored input
alias watch='watch --color'

# subversion
alias svndiff='svn diff --diff-cmd=colordiff'
alias svnaddall='svn status | awk "/\\?/ {print \$2}" | xargs svn add'

# auto-correct directory spelling errors
shopt -s cdspell

# extended pattern matching features enabled
shopt -s extglob

# make bash append rather than overwrite the history on disk
shopt -s histappend

# perform hostname completion when a word containing a @ is being completed
shopt -s hostcomplete

# allow a word beginning with # to cause that word and all remaining characters on that line to be ignored
shopt -s interactive_comments

# bash will not attempt to search the PATH for possible completions when completion is attempted on an empty line
shopt -s no_empty_cmd_completion

# case insensitive matching when performing pathname expansion
shopt -s nocaseglob

# whenever displaying the prompt, write the previous line to disk
# so new shell gets the history lines from all previous shells
export PROMPT_COMMAND='history -a'

# don't put duplicate lines in the history
export HISTCONTROL=ignoredups

# increase history limit (100KB or 5K entries)
export HISTFILESIZE=100000
export HISTSIZE=5000

# set defaul bash editor (for crontab et al.)
EDITOR=/usr/bin/vim
VISUAL=/usr/bin/vim
export EDITOR
export VISUAL

# turn off terminal driver flow control (CTRL+S/CTRL+Q) (if we are a terminal)
if [ -t 0 ]; then
  stty -ixon -ixoff
fi

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# source bash_completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# git function
function scoreboard () {
  git log | grep Author | sort | uniq -ci | sort -hr
}

# PS1 (shell prompt)

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

function parse_git_dirty {
  git diff --quiet HEAD &>/dev/null
  [[ $? == 1 ]] && echo "⚡"
}

function parse_git_branch {
  local branch=$(__git_ps1 "%s")
  [[ $branch ]] && echo "[$branch$(parse_git_dirty)]"
}

PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\$(parse_git_branch)\[\033[00m\]\$ "

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/zhengong/.sdkman"
[[ -s "/Users/zhengong/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/zhengong/.sdkman/bin/sdkman-init.sh"
eval "$(rbenv init -)"

