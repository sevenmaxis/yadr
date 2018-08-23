# Put here code like you're adding code to ~/.zshrc file

export EDITOR=nvim

eval "$(direnv hook zsh)"

if command -v tmux>/dev/null; then
  if [[ $platform == 'darwin' ]]; then
    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && [[ $TERM_PROGRAM == 'iTerm.app' ]] && exec tmux
  elif [[ $platform == 'linux' ]]; then
    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
  else
    echo "Can't recognise the platform"
  fi
else
  echo "Can't find tmux"
fi
