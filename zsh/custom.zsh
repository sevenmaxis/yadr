# Put here code like you're adding code to ~/.zshrc file

export EDITOR='nvim'

if command -v tmux>/dev/null; then
  if [[ $platform == 'darwin' ]]; then
    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && [[ $TERM_PROGRAM == 'iTerm.app' ]] && exec tmux attach
  elif [[ $platform == 'linux' ]]; then
    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux attach
  else
    echo "Can't recognise the platform"
  fi
else
  echo "Can't find tmux"
fi

export HOMEBREW_GITHUB_API_TOKEN="63cdb22824c4a6f511f3eb9271c26f2c6fcd522b"

function rails() {
  if [ "$1" = "start" ]; then
     if [ "$2" = "" ]; then
        RENV="development"
     else
        RENV="$2"
     fi
     rails server -d -e "$RENV"
     return 0
  elif [ "$1" = "stop" ]; then
     if [ -f tmp/pids/server.pid ]; then
        kill $2 $(cat tmp/pids/server.pid)
        return 0
     else
        echo "It seems there is no server running or you are not in a rails project root directory"
        return 1
     fi
  elif [ "$1" = "restart" ]; then
     rails stop && rails start $2
  else
     command rails $@
  fi;
}