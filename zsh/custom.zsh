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
