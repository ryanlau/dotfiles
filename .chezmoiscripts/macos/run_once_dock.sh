#!/bin/bash

# remove dock animations and delay
# https://youtu.be/ZaxkqlRE-NI
defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
