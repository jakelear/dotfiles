export PATH=/usr/local/bin:/Users/jakelear/BrowserStackLocal:/usr/local/sbin:$PATH
GOPATH=~/golang
PATH="$HOME/.rbenv/bin:/usr/local/go/bin:$PATH:$GOPATH/bin:~/bin:"
export CHORUS_API_CLIENT_ID=24
export PATH="$PATH"
eval "$(rbenv init -)"
export SOLR_HOME=/usr/local/solr14

set -o vi

# Hide hidden files
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles FALSE
killall Finder'

# Show hidden files
alias showhidden='defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder'

# List
alias ll='ls -la'

# Colored git log
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Git shortcuts
alias gs='git status'
alias gd='git diff'
alias ga='git add .'
alias gco='git co'
alias gci='git ci'
alias grb='git rb'

# Rails
alias be='bundle exec'
alias bfs='be foreman start'
alias ss='be rails s'
alias bfp='bundle exec foreman start all=1,presto=0'
alias sp='bundle exec rake presto:start'

# Project directories
alias sbn='cd ~/Projects/sbn'
alias bw='cd ~/Projects/billboards-web'
alias capi='cd ~/Projects/chorus-analytics-api'
alias pho='cd ~/Projects/phonograph-ui'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export BUNDLER_EDITOR=subl

# sandbox deploy
sbdeploy()
{
  be cap sandbox deploy SANDBOX_DOMAIN="$@"
}

# check what's running on passed port
portcheck()
{
  lsof -i :$@
}

#dir colors
export CLICOLOR=1
c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

parse_git_branch ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
          gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  else
          return 0
  fi
  echo -e $gitver
}

branch_color ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
    color=""
    if git diff --quiet 2>/dev/null >&2
    then
      color="${c_green}"
    else
      color=${c_red}
    fi
  else
    return 0
  fi
  echo -ne $color
}

# Colored git branch in prompt
PS1='\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]|\[\033[37m\]\t\[\033[m\]|\[\033[36m\]\u@\h\[\033[m\]|\[\033[1;31m\]\w\[\033[m\]\n$ '

# source ~/.nvm/nvm.sh
# [[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
