#!/bin/bash

if [ "$(basename "$SHELL")" != "zsh" ]; then
  echo "default shell is not zsh, changing it now..."
  chsh -s "$(which zsh)"
else
  echo "default shell is already zsh."
fi
