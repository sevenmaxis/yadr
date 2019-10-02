# Put here code like you're adding code to ~/.zshrc file

export EDITOR='nvim'

export HOMEBREW_GITHUB_API_TOKEN="5413451540578a78f8d76de773ff2c3b3ffec542"

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
        return 0
     fi
  elif [ "$1" = "restart" ]; then
     rails stop && rails start $2
  else
     command rails $@
  fi;
}

