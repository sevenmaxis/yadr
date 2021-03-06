# Aliases in this file are bash and zsh compatible

# Don't change. The following determines where YADR is installed.
yadr=$HOME/.yadr

# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# YADR support
alias yav='yadr vim-add-plugin'
alias ydv='yadr vim-delete-plugin'
alias ylv='yadr vim-list-plugin'
alias yup='yadr update-plugins'
alias yip='yadr init-plugins'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

unalias ll 2>/dev/null
if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='ls -lah'
  alias l='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
  alias lt='ls --tree'
fi
alias l="ls -1"

# show me files matching "ls grep"
alias lsg='ll | grep'

# show files matching "ls ag"
alias lsa='ll | ag'

# Alias Editing
TRAPHUP() {
  source $yadr/zsh/aliases.zsh
}

alias ae='vim $yadr/zsh/aliases.zsh' #alias edit
alias ar='source $yadr/zsh/aliases.zsh'  #alias reload
alias gar="killall -HUP -u \"$USER\" zsh"  #global alias reload
alias zr='source ~/.zshrc' #alias to reload zshrc

# mimic vim functions
alias vim="nvim"
alias vi="nvim"
alias :q='exit'

# vimrc editing
alias ve='vim ~/.vimrc'

# zsh profile editing
alias ze='vim ~/.zshrc'

# Git Aliases
alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='vim .gitignore'
alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias gp='git add $(git ls-files -m -o --exclude-standard | fzf -m)'
alias gap='git add -p'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gria='git rebase --interactive --autosquash'
alias gl='git l'
alias glg='git l'
alias glog='git l'
alias co='git co'
alias gf='git fetch'
alias gfp='git fetch --prune'
alias gfa='git fetch --all'
alias gfap='git fetch --all --prune'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
# Staged and cached are the same thing
alias gdc='git diff --cached -w'
alias gds='git diff --staged -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'
alias gdmb='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias gu='git add -u'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

# Zippin
alias gz='tar -zcvf'

# Ruby
alias c='rails c' # Rails 3
alias co='script/console' # Rails 2
alias cod='script/console --debugger'

#If you want your thin to listen on a port for local VM development
#export VM_IP=10.0.0.1 <-- your vm ip
alias ts='thin start -a ${VM_IP:-127.0.0.1}'
alias ms='mongrel_rails start'
alias tfdl='tail -f log/development.log'
alias tftl='tail -f log/test.log'

alias ka9='killall -9'
alias k9='kill -9'

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'

# TODOS
# This uses NValt (NotationalVelocity alt fork) - http://brettterpstra.com/project/nvalt/
# to find the note called 'todo'
alias todo='open nvalt://find/todo'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'

# Zeus
alias zs='zeus server'
alias zc='zeus console'
# alias zr='zeus rspec'
alias zrc='zeus rails c'
alias zrs='zeus rails s'
alias zrdbm='zeus rake db:migrate'
alias zrdbtp='zeus rake db:test:prepare'
alias zzz='rm .zeus.sock; pkill zeus; zeus start'

# Rspec
alias rs='rspec spec'
alias sr='spring rspec'
alias src='spring rails c'
alias srgm='spring rails g migration'
alias srdm='spring rake db:migrate'
alias srdt='spring rake db:migrate'
alias srdmt='spring rake db:migrate db:test:prepare'


# Sprintly - https://github.com/nextbigsoundinc/Sprintly-GitHub
alias sp='sprintly'
# spb = sprintly branch - create a branch automatically based on the bug you're working on
alias spb="git checkout -b \`sp | tail -2 | grep '#' | sed 's/^ //' | sed 's/[^A-Za-z0-9 ]//g' | sed 's/ /-/g' | cut -d"-" -f1,2,3,4,5\`"

alias hpr='hub pull-request'
alias grb='git recent-branches'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias dbtp='spring rake db:test:prepare'
alias dbm='spring rake db:migrate'
alias dbmr='spring rake db:migrate:redo'
alias dbmd='spring rake db:migrate:down'
alias dbmu='spring rake db:migrate:up'

# Personal
alias p="pass show -c"
if [[ $platform == 'darwin' ]]; then
  alias sdn="say \'done\'"
  alias pi="afplay /System/Library/Sounds/Submarine.aiff"
fi

# Homebrew
if [[ $platform == 'darwin' ]]; then
  alias brewu='brew update && brew upgrade &&\
               brew cleanup && brew doctor'
elif [[ $platform == 'linux' ]]; then
  alias brewu='brew doctor && brew upgrade && brew update'
fi

# Translate Shell
function t {
  case "$*" in
    [A-Za-z]* ) trans -sp en:ru $*
      ;;
    [А-Яа-я]* ) trans ru:en $*
      ;;
    *)          echo "wrong language"
  esac
}

mktouch() {
  if [ $# -lt 1 ]; then
    echo "Missing argument";
    return 1;
  fi

  for f in "$@"; do
    mkdir -p -- "$(dirname -- "$f")"
    touch -- "$f"
  done
}

# Temporarely: delete line '${(z)VISUAL:-${(z)EDITOR}}'"
# in file zsh/prezto/modules/utility/init.zsh
unalias e &>/dev/null
function e() {
  if [ $# -lt 1 ]; then
    echo "Missing an argument"
    return 1;
  fi
  printf '%s\n' "${(P)1}"
}

if [[ $platform == 'darwin' ]]; then
  alias c="pbcopy"
  alias v="pbpaste"
  alias nproc='sysctl -n hw.ncpu'
elif [[ $platform == 'linux' ]]; then
  alias c="xclip -selection clipboard"
  alias v="xclip -o -selection clipboard"
fi

alias pb="tr -d '\n' | pbcopy"
alias nv=nvim

alias dc='docker-compose'
alias dcr="docker container"

alias clrtmux="tmux kill-session -t 0"
alias tx="tmuxinator"
alias txstart='for project in $(tmuxinator list | sed "1d"); do
  tmuxinator start "$project"
done
tmux attach'

alias be='bundle exec'
alias rc='RUBYOPT="-W:no-deprecated -W:no-experimental" bundle exec rails console'
alias rs='RUBYOPT="-W:no-deprecated -W:no-experimental" bundle exec rails server'
alias pry='RUBYOPT="-W:no-deprecated -W:no-experimental" pry'
alias cat='ccat'
alias typora="open -a typora"

heroku(){
  local name=$(tmux display-message -p '#W')
  local index=$(tmux display-message -p '#I')
  local session=$(tmux display-message -p '#S')
  local line=`echo $* | sed -E 's/(run )|(--app )|(--app=)//g'`
 
  tmux rename-window -t $session:$index "heroku $line"

  trap "{ tmux rename-window -t $session:$index $name }" SIGINT

  command heroku "$@"

  tmux rename-window -t $session:$index $name

  afplay /System/Library/Sounds/Submarine.aiff
}

rails(){
  local name=$(tmux display-message -p '#W')
  local index=$(tmux display-message -p '#I')
  local session=$(tmux display-message -p '#S')

  tmux rename-window -t $session:$index "rails $@"

  trap "{ tmux rename-window -t $session:$index $name }" SIGINT

  command rails "$@"

  tmux rename-window -t $session:$index $name
}

bundle(){
  export RUBYOPT='-W0'

  local name=$(tmux display-message -p '#W')
  local index=$(tmux display-message -p '#I')
  local session=$(tmux display-message -p '#S')

  concat=false
  string=""
  playsound=false
  for var in "$@"; do
    if [ "$concat" = true ]; then
      string+="$var "
    fi
    if [ "$var" = 'exec' ]; then
      concat=true
    fi
    if [ "$var" = 'rspec' ]; then
      playsound=true
    fi
  done

  if [ ! -z "$string" ]; then
    tmux rename-window -t $session:$index $string
  fi

  trap "{ tmux rename-window -t $session:$index $name }" SIGINT

  command bundle "$@"

  if [ $playsound ]; then
    afplay /System/Library/Sounds/Submarine.aiff
  fi
  
  tmux rename-window -t $session:$index $name
}

fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}

function cd() {
    if [[ "$#" != 0 ]]; then
        builtin cd "$@";
        return
    fi
    while true; do
        local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
        local dir="$(printf '%s\n' "${lsd[@]}" |
            fzf --reverse --preview '
                __cd_nxt="$(echo {})";
                __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
                echo $__cd_path;
                echo;
                ls -p --color=always "${__cd_path}";
        ')"
        [[ ${#dir} != 0 ]] || return 0
        builtin cd "$dir" &> /dev/null
    done
}

chrome() {
  local cols sep google_history open
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  if [ "$(uname)" = "Darwin" ]; then
    google_history="$HOME/Library/Application Support/Google/Chrome/Default/History"
    open=open
  else
    google_history="$HOME/.config/google-chrome/Default/History"
    open=xdg-open
  fi
  cp -f "$google_history" /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open > /dev/null 2> /dev/null
}

fco() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi) || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

