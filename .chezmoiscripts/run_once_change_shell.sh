#!/bin/bash

# check if zsh is installed
if ! command -v zsh &>/dev/null; then
  echo "zsh is not installed"
  echo "please install zsh and run chezmoi apply"
  exit 1
fi

# check if zsh was installed with nix
NIX_ZSH_PATH="$HOME/.nix-profile/bin/zsh"

if [ -x "$NIX_ZSH_PATH" ]; then
  # check if $NIX_ZSH_PATH is in /etc/shells, required for zsh to be a login shell
  if ! grep -q "^$NIX_ZSH_PATH$" /etc/shells; then
    echo "$NIX_ZSH_PATH is not in /etc/shells. adding it now..."
    echo "$NIX_ZSH_PATH" | sudo tee -a /etc/shells >/dev/null
    echo "added $NIX_ZSH_PATH to /etc/shells."
  fi
fi

if [ "$(basename "$SHELL")" != "zsh" ]; then
  echo "default shell is not zsh, changing it now..."
  chsh -s "$(which zsh)"
else
  echo "default shell is already zsh."
fi
