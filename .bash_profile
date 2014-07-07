export PATH="/usr/local/heroku/bin:/usr/local/bin:/usr/local/mysql/bin:/usr/local/sbin:/Users/jake/.local/lib/aws/bin/:/Users/jake/work/AndroidSDK/sdk/platform-tools:/Applications/Postgres.app/Contents/MacOS/bin:/Users/jake/Work/AndroidSDK/sdk/tools:/usr/bin/vboxmanage:$HOME/.rbenv/shims:$PATH"
export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH"
export SOLR_HOME=~/Code/solr14

set -o vi
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles FALSE
killall Finder'
alias showhidden='defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder'
alias ll='ls -la'
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias be='bundle exec'
alias bm='bundle exec middleman'
alias gs='git status'
alias gd='git diff'
alias ga='git add .'
alias bfs='be foreman start'
alias sbn='cd ~/Projects/sbn'
alias vc='cd ~/Projects/voxcar'
alias grim='cd ~/Projects/grimoire'
alias ss='be rails s'

export BUNDLER_EDITOR=subl

# sandbox deploy
sbdeploy()
{
  be cap sandbox deploy SANDBOX_DOMAIN="$@"
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

#export PS1='[\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]] \u@\[${c_red}\]\w\[${c_sgr0}\]: '
#prompt
PS1='\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]|\[\033[37m\]\t\[\033[m\]|\[\033[36m\]\u@\h\[\033[m\]|\[\033[1;31m\]\w\[\033[m\]\n$ '


source ~/.git-completion.sh
export GOPATH=$HOME/gocode
PATH="$PATH:$GOPATH/bin"PATH="$PATH:$GOPATH/bin"
